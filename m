Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34BAA1C9828
	for <lists+linux-leds@lfdr.de>; Thu,  7 May 2020 19:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgEGRpW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 7 May 2020 13:45:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40738 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgEGRpW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 7 May 2020 13:45:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 13D1A1C0257; Thu,  7 May 2020 19:45:20 +0200 (CEST)
Date:   Thu, 7 May 2020 19:45:19 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Xing Zhang <Xing.Zhang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v1] Add support for MediaTek regulator vibrator driver
Message-ID: <20200507174519.GD1216@bug>
References: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> This patchset add regulator vibrator driver for MTK Soc. The driver 
> controls vibrator through regulator's enable and disable.

We'd prefer not to have vibrators in led subsystem.

> 
> Xing Zhang (3):
>   dt-bindings: add regulator vibrator documentation
>   arm64: mediatek: Add regulator vibrator support
>   Vibrator: Add regulator vibrator driver
> 
>  .../bindings/leds/regulator-vibrator.txt      |  39 ++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/regulator-vibrator.c             | 450 ++++++++++++++++++

OTOH, connecting LED to regulator might make some sense. I can take the driver with
vibrator functionality stripped, provided it is named the usual way...

Best regards,
										Pavel
