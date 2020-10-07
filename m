Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6692285F05
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 14:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgJGMV6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Oct 2020 08:21:58 -0400
Received: from w1.tutanota.de ([81.3.6.162]:40080 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728232AbgJGMV6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 7 Oct 2020 08:21:58 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 76573FBB3C4;
        Wed,  7 Oct 2020 12:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1602073316;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=gNU20v49DNc2tImiHmQOA4skJFG1Bim7XIhKqq2df+k=;
        b=wp6+YwO2o5OqQ/Qn3eeoDuBTqET8gqymPsFMhGZSxlhug0RHhKGdnHBVYK0i7fkQ
        O4ndUlpX728SRu9E5BgzpvHY6d8zMXJYcp4qBd48c9n3R0nfttkr4M+hYDSAKHpE8fl
        vOMTWiU+JxIRZQXiUPeBYRS3JMHWfdB4G8uTuS85LFSWiNjEgUsC+eRpp77IjlOkYY+
        pJDtPcBgpXr6kBBtyArdZHNM24pRls7MoCHN/vZAMI9d4BEAi9GWaxb8cQVj59pKGjN
        7MHqXKhnY7g4JVYcVSJlKHmf34eiSaAAZErK/6oy+d/r8w/wYDxDrwoqfixD3OtP41+
        fuWwiOvITw==
Date:   Wed, 7 Oct 2020 14:21:56 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Marek Behun <kabel@blackhole.sk>
Cc:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MJ2-gcy----2@tutanota.com>
In-Reply-To: <20201007012600.3b3e7779@blackhole.sk>
References: <MIuPIKy--3-2@tutanota.com> <20201007012600.3b3e7779@blackhole.sk>
Subject: Re: [PATCH] lm3697: Rename struct into more appropiate name
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The reason I didn't use git send-mail earlier is because Tutanota doesn't supports SMTP and Protonmail requires a paid account for using SMTP/IMAP. However, I made an account creation request for Disroot(which does support SMTP for free), so when/if the account gets created I'll send future patches through there.
Oct 6, 2020, 23:26 by kabel@blackhole.sk:

> On Mon, 5 Oct 2020 22:17:14 +0200 (CEST)
> ultracoolguy@tutanota.com wrote:
>
>> Subject says it all. This rename was briefly discussed in this other patch: https://www.spinics.net/lists/linux-leds/msg16865.html (I don't know another way to link to emails, so I'll just use this archive).
>>
>> Feel free to suggest another name for the commit; that was just the better name I could come up with :/ .
>>
>>
>>
>
> Gabriel,
>
> the subject of the patch should be
>  leds: lm3697: Rename struct into more appropiate name
> ("leds: " is prefixed). Look at history
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/leds?h=v5.9-rc8
>
> The commit message should mention why you are renaming the type
> (something like "to be semantically more correct, since that structure
> represents LED control bank as described by the datasheet").
>
> Also it seems that you are using git format-patch for generating patch
> files, but you are sending these patches as regular e-mail attachements.
> You should instead use git send-email, as is normally required
> for kernel patches (and they would also appear in patchwork
> (https://patches.linaro.org/project/linux-leds/list/). Please look at
> https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html
> and https://git-send-email.io/.
>
> Marek
>

