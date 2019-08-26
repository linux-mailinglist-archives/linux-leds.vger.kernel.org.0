Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853F79D8C2
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2019 23:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfHZV60 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 26 Aug 2019 17:58:26 -0400
Received: from muru.com ([72.249.23.125]:58762 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfHZV60 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 26 Aug 2019 17:58:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id AE30580AA;
        Mon, 26 Aug 2019 21:58:54 +0000 (UTC)
Date:   Mon, 26 Aug 2019 14:58:22 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] leds: lm3532: Fix brightness control for i2c mode
Message-ID: <20190826215822.GY52127@atomide.com>
References: <20190820195307.27590-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820195307.27590-1-dmurphy@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

* Dan Murphy <dmurphy@ti.com> [190820 19:53]:
> Fix the brightness control for I2C mode.  Instead of
> changing the full scale current register update the ALS target
> register for the appropriate banks.
> 
> In addition clean up some code errors and random misspellings found
> during coding.
> 
> Tested on Droid4 as well as LM3532 EVM connected to a BeagleBoneBlack
> 
> Fixes: e37a7f8d77e1 ("leds: lm3532: Introduce the lm3532 LED driver")
> Reported-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
> 
> v3 - Removed register define updates - https://lore.kernel.org/patchwork/patch/1114542/

Looks like starting with this patch in Linux next the LCD on droid4
is so dim it's unreadable even with brightness set to 255. Setting
brightness to 0 does blank it completely though.

Did something maybe break with the various patch revisions or are
we now missing some dts patch?

Regards,

Tony
