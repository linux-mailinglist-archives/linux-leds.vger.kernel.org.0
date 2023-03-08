Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4AA86AFF7A
	for <lists+linux-leds@lfdr.de>; Wed,  8 Mar 2023 08:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjCHHKi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Mar 2023 02:10:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjCHHKg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Mar 2023 02:10:36 -0500
X-Greylist: delayed 2965 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 07 Mar 2023 23:10:30 PST
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net [46.105.58.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56944C0A
        for <linux-leds@vger.kernel.org>; Tue,  7 Mar 2023 23:10:29 -0800 (PST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.146.82])
        by mo575.mail-out.ovh.net (Postfix) with ESMTP id 8870B22A99
        for <linux-leds@vger.kernel.org>; Wed,  8 Mar 2023 06:21:02 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-8btrn (unknown [10.110.103.246])
        by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id E51751FE41;
        Wed,  8 Mar 2023 06:21:01 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
        by ghost-submission-6684bf9d7b-8btrn with ESMTPSA
        id cjWaNk0pCGTz1QMA9qD2fA
        (envelope-from <rafal@milecki.pl>); Wed, 08 Mar 2023 06:21:01 +0000
MIME-Version: 1.0
Date:   Wed, 08 Mar 2023 07:21:00 +0100
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-leds@vger.kernel.org,
        William Zhang <william.zhang@broadcom.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: bcm63138: refer to ARCH_BCMBCA instead of
 ARCH_BCM4908
In-Reply-To: <20230307082936.16631-1-lukas.bulwahn@gmail.com>
References: <20230307082936.16631-1-lukas.bulwahn@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <b2b0db0e6489a4a7daa2606c1febabbb@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 2976316407250594779
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdduuddgleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggffhffvvefujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejvdelgfeutdfhfeelheegfedtleduleeuvdfgfeefvefhvedtheetjeetfeehgeenucfkphepuddvjedrtddrtddruddpudelgedrudekjedrjeegrddvfeefpddujeeirdefuddrvdefkedruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrrghfrghlsehmihhlvggtkhhirdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2023-03-07 09:29, Lukas Bulwahn wrote:
> Commit dd5c672d7ca9 ("arm64: bcmbca: Merge ARCH_BCM4908 to 
> ARCH_BCMBCA")
> removes config ARCH_BCM4908 as config ARCH_BCMBCA has the same intent.
> 
> Probably due to concurrent development, commit a0ba692072d8 ("leds:
> bcm63138: add support for BCM63138 controller") introduces 'LED Support
> for Broadcom BCM63138 SoC' that depends on ARCH_BCM4908, but this use 
> was
> not visible during the config refactoring from the commit above. Hence,
> these two changes create a reference to a non-existing config symbol.
> 
> Adjust the LEDS_BCM63138 definition to refer to ARCH_BCMBCA instead of
> ARCH_BCM4908 to remove the reference to the non-existing config symbol
> ARCH_BCM4908.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Rafał Miłecki <rafal@milecki.pl>
