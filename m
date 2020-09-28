Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49CB27AA02
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 10:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgI1IzP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Mon, 28 Sep 2020 04:55:15 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:39708 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgI1IzO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 28 Sep 2020 04:55:14 -0400
Received: from relay10.mail.gandi.net (unknown [217.70.178.230])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 632AC3B42F2
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2020 08:53:04 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8884D24000B;
        Mon, 28 Sep 2020 08:52:42 +0000 (UTC)
Date:   Mon, 28 Sep 2020 10:52:40 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Marek Behun <kabel@blackhole.sk>
Cc:     Imre Kaloz <kaloz@openwrt.org>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        linux-leds@vger.kernel.org
Subject: Re: Armada 385 Linksys: request for test of 2 patches for
 linux-leds
Message-ID: <20200928105240.14c6bf67@xps13>
In-Reply-To: <20200924194117.674aba86@blackhole.sk>
References: <20200924194117.674aba86@blackhole.sk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

Marek Behun <kabel@blackhole.sk> wrote on Thu, 24 Sep 2020 19:41:17
+0200:

> Hello Imre, Miquel, Gregory,
> 
> you are listed as some of the authors of commits for device tree for
> armada-385-linksys* devices.
> 
> Do you still have access to such a device?
> 
> This device should, according to DT, contain a LED pca9635 controller.
> 
> I am searching for someone to test some patches I sent to linux-leds
> for this driver.
> 
> If you are willing, it concers the top two patches of branch
> leds-pca963x-for-test of my kernel repository:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git/log/?h=leds-pca963x-for-test

Unfortunately I am not in possession of this board anymore :/

Thanks,
Miquèl
