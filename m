Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1963E36FCE8
	for <lists+linux-leds@lfdr.de>; Fri, 30 Apr 2021 16:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232817AbhD3OwJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Apr 2021 10:52:09 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:31822 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232893AbhD3OwH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Apr 2021 10:52:07 -0400
X-Greylist: delayed 404 seconds by postgrey-1.27 at vger.kernel.org; Fri, 30 Apr 2021 10:52:06 EDT
Received: from [10.0.29.28] (unknown [10.0.29.28])
        by uho.ysoft.cz (Postfix) with ESMTP id 85F79A4A59;
        Fri, 30 Apr 2021 16:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1619793868;
        bh=ad8b/z/Q2NAjlexgC5YGYyBNg++4NkBcpAE6LMxgVE8=;
        h=To:From:Subject:Cc:Date:From;
        b=qRu1gr3vbt47oyKvWGvNLTo054B9yl18LR7gsclyiPmZMXwOyY3O2xHDQHOS26ybL
         qYPMRUQIfSPrpMlxFUMmqZCWzdu32cf3v2rjrXiQt9YLW+7B5TCvtQ4zRDp8fc8xRQ
         y88b9EODcuQAEewI7MOjMlOttw8fjFbpqwMol97I=
To:     Dan Murphy <dmurphy@ti.com>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Subject: Broken LP5562 LEDs since multicolor framework was added
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        devicetree@vger.kernel.org
Message-ID: <36a87582-5565-6eeb-33be-ea57ef63ac15@ysoft.com>
Date:   Fri, 30 Apr 2021 16:44:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,

I am in a process of upgrading kernel from v5.5 to v5.10 on our imx6dl-yapp4
platform and I just realized that LEDs on the board stopped working.

I bisected the problem to commit 92a81562e695 ("leds: lp55xx: Add multicolor
framework support to lp55xx"). I found that you also added commit 0724cf4b8b17
("ARM: dts: imx6dl-yapp4: Add reg property to the lp5562 channel node") to
accommodate the multicolor framework.

It's a pity I was not on the Cc list for that DT change and did not have
chance to test it.

Anyways, probe of the lp5562 driver on my board fails with or without commit
0724cf4b8b17 with this error:

lp5562: probe of 1-0030 failed with error -22

AFAICT the driver fails on the lp55xx_of_populate_pdata call but I did
not get much further.

I checked the updated LED documentation/binding and at first glance
everything looks good and the DT should work.

I have no idea what might be wrong and would appreciate any advice.

Thanks,
Michal



