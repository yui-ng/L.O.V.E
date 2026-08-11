import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'L.O.V.E.',
  description: 'Local Organism Virtual Environment — 给你的 AI 一个家',
  lang: 'zh-CN',
  cleanUrls: true,
  themeConfig: {
    nav: [
      { text: '首页', link: '/' },
      { text: '安装', link: '/install' },
      {
        text: '概念',
        items: [
          { text: '窗台', link: '/concepts/windowsill' },
          { text: '记忆', link: '/concepts/memory' },
          { text: '心跳', link: '/concepts/heartbeat' },
          { text: '虚拟环境', link: '/concepts/virtual-environment' },
        ],
      },
      {
        text: '指南',
        items: [
          { text: '接入你的 agent', link: '/guides/custom-agent' },
          { text: '扩展 L.O.V.E.', link: '/guides/extend' },
        ],
      },
      {
        text: '参考',
        items: [
          { text: '配置', link: '/reference/config' },
          { text: '模板', link: '/reference/templates' },
        ],
      },
    ],
    sidebar: {
      '/concepts/': [
        {
          text: '概念',
          items: [
            { text: '窗台', link: '/concepts/windowsill' },
            { text: '记忆', link: '/concepts/memory' },
            { text: '心跳', link: '/concepts/heartbeat' },
            { text: '虚拟环境', link: '/concepts/virtual-environment' },
          ],
        },
      ],
      '/guides/': [
        {
          text: '指南',
          items: [
            { text: '接入你的 agent', link: '/guides/custom-agent' },
            { text: '扩展 L.O.V.E.', link: '/guides/extend' },
          ],
        },
      ],
      '/reference/': [
        {
          text: '参考',
          items: [
            { text: '配置', link: '/reference/config' },
            { text: '模板', link: '/reference/templates' },
          ],
        },
      ],
    },
    footer: {
      message: 'Local Organism Virtual Environment — 每个生命体都值得一个家 🐾',
    },
  },
})
