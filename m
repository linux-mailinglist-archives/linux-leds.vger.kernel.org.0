Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6657D388D60
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 14:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352973AbhESMCG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 08:02:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237480AbhESMCF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 08:02:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE60560E0B;
        Wed, 19 May 2021 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621425645;
        bh=blIXtSnMai/7fxVhk3yLSFepus5k5UQNVnOdYzQcSKk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MmspyclnHidsqe4HbwNiYDr1YksHpoCZ9VsDwA2nAO3Q6SeWPiMHKl0cezkUzb+vK
         5e6Aymvgn+CRpipTOTNavPv5D60Rx/pHO/ITz0cK20vcXm6WXjnarSOb/uDblGuskN
         Zq9UHOH2A4tBd+vrPPcbw3TuzMmWYcQbo03FOpP17TFBbQt3D2i+3oOFD6As4+ftmB
         Zuf/cVWCD5YGxvFEq2Qrjj184mq7ipS8nL64MXZ5Sq1FUe2HBwWvDTIo2UlRLajrvB
         XAqEC0JtYYkLRUvdwN5FFVaFi7Q/J16qE9E2vCyamRbsU54m/r3+4y4fhM1oMPb4I/
         5YC/Fuj++NV5w==
Date:   Wed, 19 May 2021 14:00:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, linuxarm@huawei.com,
        mauro.chehab@huawei.com, gregkh@linuxfoundation.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 06/17] leds: leds-nuc: allow changing the LED colors
Message-ID: <20210519140040.5c685336@coco.lan>
In-Reply-To: <20210519110725.GB24621@duo.ucw.cz>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <f1fb0d3b7404bab46ba22a670ab58eb0e8b2389e.1621349814.git.mchehab+huawei@kernel.org>
        <20210519095713.07be987d@thinkpad>
        <20210519120507.3ab8c6a4@coco.lan>
        <20210519110725.GB24621@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 13:07:25 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
> 
> > > We have multicolor LED framerwork in Linux. This should be implemented
> > > via that framework. Please do not implement your own way for RGB leds.
> > > 
> > > Marek  
> > 
> > I saw the multicolor LED framework, but IMO it won't fit here.
> > 
> > See, Linux doesn't have direct access to the LED. The access is
> > provided via ACPI WMI.  
> 
> So?
> 
> > The way BIOS reports the type of the led is via a bitmap flag.
> > So, the same LED can be represented with either single-color
> > or multi-color one. See:
> > 	https://www.intel.com/content/dam/support/us/en/documents/intel-nuc/WMI-Spec-Intel-NUC-NUC10ixFNx.pdf
> > 
> > 	Table 2.2 LED Color Type
> > 	Bit Number	Type
> > 	0		Dual-color Blue / Amber
> > 	1		Dual-color Blue / White
> > 	2		RGB-color
> > 	3		Single-color LED
> > 
> > Also as each NUC can support up to 7, and they may have a mix of
> > single color, dual color and RGB LEDs, if we would use the
> > multicolor class for the colored ones, that would mean that the
> > code will need to be duplicated, as, depending on what the BIOS
> > reports, the LED would need to be exposed either as via
> > led-multicolor-class or as leds-class.  
> 
> So?
> 
> > Worse than that, there's even a WMI command that would allow
> > to "switch LED type" (see page 8). On other words, the BIOS can
> > expose a "virtual" single-color LED, but actually implemented
> > in hardware using a RGB one, and this can be changed in real time.  
> 
> So you simply always use it as RGB one?

Hmm... are you meaning that I should only use the multicolor led class,
even when the BIOS is reporting the LEDs as single color?

I can surely do that.

> 
> Best regards,
> 								Pavel

Thanks,
Mauro
