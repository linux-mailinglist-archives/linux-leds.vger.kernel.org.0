Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210EB31FB24
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 15:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbhBSOp7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 09:45:59 -0500
Received: from smtp-out.xnet.cz ([178.217.244.18]:24769 "EHLO smtp-out.xnet.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhBSOp7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 09:45:59 -0500
X-Greylist: delayed 471 seconds by postgrey-1.27 at vger.kernel.org; Fri, 19 Feb 2021 09:45:58 EST
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
        (Authenticated sender: petr@true.cz)
        by smtp-out.xnet.cz (Postfix) with ESMTPSA id DF487183A7;
        Fri, 19 Feb 2021 15:37:22 +0100 (CET)
Received: by meh.true.cz (OpenSMTPD) with ESMTP id 34801770;
        Fri, 19 Feb 2021 15:36:55 +0100 (CET)
Date:   Fri, 19 Feb 2021 15:37:11 +0100
From:   Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Andreas Eberlein <foodeas@aeberlein.de>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, zbynek.kocur@fel.cvut.cz
Subject: Re: [PATCH v2] leds: apu: extend support for PC Engines APU1 with
 newer firmware
Message-ID: <20210219143711.GA28202@meh.true.cz>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
References: <20210216133028.4025-1-foodeas@aeberlein.de>
 <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7eebbb6-df0c-51df-7701-ecb8f6543466@metux.net>
X-PGP-Key: https://gist.githubusercontent.com/ynezz/477f6d7a1623a591b0806699f9fc8a27/raw/a0878b8ed17e56f36ebf9e06a6b888a2cd66281b/pgp-key.pub
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Enrico Weigelt, metux IT consult <lkml@metux.net> [2021-02-17 12:02:47]:

Hi,

(adding Zbynek to Cc: who seems to own a complete range of APU boards and has
done the runtime testing already)

> Looks good to me. But don't dare giving official ack, since I don't
> have an apu1 board for testing.

@Zbynek can you perhaps provide your `Tested-by: Your Name <your@email>` tag
as it seems, that you've tested[1] this extensively on several boards/versions
already? I think, that you deserve credits as well. Thanks!

1. https://github.com/openwrt/openwrt/pull/3135#issuecomment-748953745

Cheers,

Petr
