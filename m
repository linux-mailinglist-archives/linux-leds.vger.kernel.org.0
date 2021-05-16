Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C577B38204F
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 20:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhEPSXn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 14:23:43 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44266 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhEPSXm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 May 2021 14:23:42 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B42DC1C0B77; Sun, 16 May 2021 20:22:26 +0200 (CEST)
Date:   Sun, 16 May 2021 20:22:21 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Doug Zobel <dougdev334@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt: bindings: lp55xx: Add predefined LED pattern
Message-ID: <20210516182221.GB3666@localhost>
References: <20210511204834.2675271-1-dougdev334@gmail.com>
 <20210511204834.2675271-3-dougdev334@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511204834.2675271-3-dougdev334@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi!

> Add a new device tree object for LP5562 predfined led patterns.

typo.

> +  "(^pattern@[0-9a-f]$|pattern)":
> +    type: object
> +    $ref: common.yaml#
> +    description: |
> +      LP5562 sepcific object.  LED pattern program saved to and run
> on LP5562.

typo.

But.. no, not like this.

We have generic pattern trigger. Take a look at its interface. Extend
it
to get parameters from device tree.

Then use existing 'default-trigger' functionality.

Best regards,
								Pavel

-- 
