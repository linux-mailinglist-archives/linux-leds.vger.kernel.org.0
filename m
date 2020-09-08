Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBBA26228F
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 00:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbgIHWWW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Tue, 8 Sep 2020 18:22:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59296 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbgIHWWV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2020 18:22:21 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 11C641C0B7A; Wed,  9 Sep 2020 00:22:18 +0200 (CEST)
Date:   Wed, 9 Sep 2020 00:22:17 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Luka Kovacic <luka.kovacic@sartura.hr>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org,
        lee.jones@linaro.org, dmurphy@ti.com, robh+dt@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, andrew@lunn.ch,
        jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr
Subject: Re: [PATCH 4/7] drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
Message-ID: <20200908222217.GA1005@bug>
References: <20200905130336.967622-1-luka.kovacic@sartura.hr>
 <20200905130336.967622-5-luka.kovacic@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200905130336.967622-5-luka.kovacic@sartura.hr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Add support for the iEi WT61P803 PUZZLE LED driver.
> Currently only the front panel power LED is supported.
> 
> This driver depends on the iEi WT61P803 PUZZLE MFD driver.
> 
> Signed-off-by: Luka Kovacic <luka.kovacic@sartura.hr>
> Cc: Luka Perkov <luka.perkov@sartura.hr>

> +#define CMD_CHAR(x) (char)(x)

Come on... no need to hide this in macro.

> *resp_buf = kmalloc(IEI_WT61P803_PUZZLE_BUF_SIZE, GFP_KERNEL); + + 

AFAICT you'll happily dereference NULL when kmalloc fails.

If it is small, should you just put buffer on stack?
									Pavel
