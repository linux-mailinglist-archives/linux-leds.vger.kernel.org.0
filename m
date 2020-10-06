Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258D5284EA9
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 17:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgJFPOX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 11:14:23 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:49498 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgJFPOX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 11:14:23 -0400
Received: from in-2.websupport.sk (unknown [10.10.2.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id 5C7ECC9F82;
        Tue,  6 Oct 2020 17:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1601997260;
        bh=kYbaQs68qmtfT6rkRwmtAso3OMGOEpHMiJs972Pup2w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=ba7rs1BaN1VufQ0wVciGmz+jzn0sz5O/Hm5PjIOU8PwlX2beNVBw++jMkswhG4aBK
         sYUXvgzj8Ps4fJzJbGKRy9lzQMdtnjv3CErscg/Khxsrbbgwmh7FJ8wDVY1gGbnXug
         uKtmNbBfo0ahciPvlyl6N+B+pss1IWDtjwmwQq5U=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-2.websupport.sk (Postfix) with ESMTPSA id 4C5Lbb74bnz40X1j;
        Tue,  6 Oct 2020 17:14:19 +0200 (CEST)
Date:   Tue, 6 Oct 2020 17:14:19 +0200
From:   Marek Behun <kabel@blackhole.sk>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <ultracoolguy@tutanota.com>, Pavel <pavel@ucw.cz>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
Message-ID: <20201006171419.5f5d9df4@blackhole.sk>
In-Reply-To: <85515ccd-3431-4565-eaad-3e1d116bf89f@ti.com>
References: <20201005141334.36d9441a@blackhole.sk>
        <MIt2NiS--3-2@tutanota.com>
        <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
        <MItBqjy--3-2@tutanota.com>
        <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
        <MItOR9Z--3-2@tutanota.com>
        <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de>
        <MItjEho--3-2@tutanota.com>
        <20201005173227.GA6431@duo.ucw.cz>
        <20201006093356.6d25b280@blackhole.sk>
        <MIxm3uX--3-2@tutanota.com>
        <144aa75a-4369-cd81-d7dc-2354a9afd7c5@ti.com>
        <20201006164101.2c3fa0d7@blackhole.sk>
        <85515ccd-3431-4565-eaad-3e1d116bf89f@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Out-Rspamd-Queue-Id: 4C5Lbb74bnz40X1j
Authentication-Results: in-2.websupport.sk;
        auth=pass smtp.auth=kabel@blackhole.sk smtp.mailfrom=kabel@blackhole.sk
X-Out-Rspamd-Server: mail-antispam-6
X-Out-Spamd-Result: default: False [-1.60 / 24.00];
         ARC_NA(0.00)[];
         GENERIC_REPUTATION(0.00)[-0.58215740698334];
         BAYES_HAM(-3.00)[99.99%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         RCPT_COUNT_SEVEN(0.00)[7];
         FUZZY_BLOCKED(0.00)[rspamd.com];
         RCVD_COUNT_ZERO(0.00)[0];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:2852, ipnet:78.128.128.0/17, country:CZ];
         MID_RHS_MATCH_FROM(0.00)[];
         SUSPICIOUS_RECIPS(1.50)[]
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 6 Oct 2020 09:57:08 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> Unfortunately we cannot and should not change the ABI now.
> 
> Using the led-sources as the bank indicator does not conform to the 
> definition of the description of the led-sources in the yaml.
> 
> The preference was to use the led-sources to define the LED out to the bank.
> 
> Here is the conversation on how the driver got to where it is.
> 
> https://lore.kernel.org/patchwork/patch/972337/
> 
> Dan
> 

Oh, if this was discussed already, then never mind. Sorry for taking
your time.

Marek
