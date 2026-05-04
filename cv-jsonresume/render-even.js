#!/usr/bin/env node
// Render the "even" theme (ESM-only) to PDF using puppeteer
import fs from 'node:fs'
import path from 'node:path'
import { fileURLToPath } from 'node:url'
import puppeteer from 'puppeteer'
import { render } from 'jsonresume-theme-even'

const __dirname = path.dirname(fileURLToPath(import.meta.url))
const resume = JSON.parse(fs.readFileSync(path.join(__dirname, 'resume.json'), 'utf-8'))
const html = render(resume)

const htmlPath = path.join(__dirname, 'resume-even.html')
fs.writeFileSync(htmlPath, html)

const browser = await puppeteer.launch({ headless: 'new' })
const page = await browser.newPage()
await page.goto('file://' + htmlPath, { waitUntil: 'networkidle0' })
await page.emulateMediaType('print')
await page.pdf({
  path: path.join(__dirname, 'resume-even.pdf'),
  format: 'A4',
  printBackground: true,
  margin: { top: '15mm', bottom: '15mm', left: '15mm', right: '15mm' }
})
await browser.close()
console.log('Wrote resume-even.pdf')
