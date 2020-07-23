Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFE922B893
	for <lists+linux-leds@lfdr.de>; Thu, 23 Jul 2020 23:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbgGWVYg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Jul 2020 17:24:36 -0400
Received: from mail.nic.cz ([217.31.204.67]:46740 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726029AbgGWVYg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Jul 2020 17:24:36 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id E21391409A4;
        Thu, 23 Jul 2020 23:24:34 +0200 (CEST)
Date:   Thu, 23 Jul 2020 23:24:34 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: add orange color
Message-ID: <20200723232434.1871c4fa@nic.cz>
In-Reply-To: <20200723231755.6b6476c0@nic.cz>
References: <20200723125751.4045-1-marek.behun@nic.cz>
        <20200723193908.GA26165@amd>
        <57981a86-dd1b-09ee-8035-4c84d4c990df@gmail.com>
        <30b1f173-c687-9fe2-92bd-fc53f776cb77@gmail.com>
        <20200723201657.nb5dm2aqmjnizmpq@duo.ucw.cz>
        <8b36be51-3a75-458d-4fed-d730621e1547@gmail.com>
        <20200723203953.iijldzbnfqh36mex@duo.ucw.cz>
        <854ee2f0-4dd1-b665-f216-bff33ab3b571@gmail.com>
        <20200723210452.c63oup3k7w4icqc6@duo.ucw.cz>
        <20200723231755.6b6476c0@nic.cz>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Jul 2020 23:17:55 +0200
Marek Behun <marek.behun@nic.cz> wrote:

> LOL, so I looked into schematics and the manufacturer of the ethernet
> port cage calls the LED yellow. So apparently I confused it with
> orange... :D
> 
> http://www.link-pp.com/?product/201807116277.html
> see LED Option in the table

OK so I think we can ignore this "orange" color proposal now, sorry
for taking your time.

I would really appreciate though if we could talk about the road I took
in v2 of the RFC "Add support for LEDs on Marvell PHYs", as compared to
the road in v1. That is a real problem... :D

Marek
