Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E2E277601
	for <lists+linux-leds@lfdr.de>; Thu, 24 Sep 2020 17:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgIXP5i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 24 Sep 2020 11:57:38 -0400
Received: from mail.nic.cz ([217.31.204.67]:57336 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728139AbgIXP5i (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 24 Sep 2020 11:57:38 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id E43311408AF;
        Thu, 24 Sep 2020 17:57:36 +0200 (CEST)
Date:   Thu, 24 Sep 2020 17:57:35 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Markus Moll <moll.markus@arcor.de>
Cc:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: Re: [PATCH v1 1/2] leds: pca9532: read pwm settings from device
 tree
Message-ID: <20200924175735.175486ef@nic.cz>
In-Reply-To: <198551419.101933.1600803075307@mail.vodafone.de>
References: <198551419.101933.1600803075307@mail.vodafone.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 22 Sep 2020 21:31:15 +0200 (CEST)
Markus Moll <moll.markus@arcor.de> wrote:

> While the two pca9532 pwms can be configured in the platform data
> struct, there was no corresponding dt binding. Users need to configure
> the pwm if some leds should blink or continue blinking during boot.
> 
> Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
> ---

> +	of_property_read_u8_array(np, "nxp,pwm", &pdata->pwm[0],
> +				  ARRAY_SIZE(pdata->pwm));
> +	of_property_read_u8_array(np, "nxp,psc", &pdata->psc[0],
> +				  ARRAY_SIZE(pdata->psc));
> +

This properties are not documented in device tree bindings.

Moreover there are pwm-dutycycle-unit and pwm-dutycycle-range
properties documented for pwm-regulator. Maybe these should be used?

Marek
