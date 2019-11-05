Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2594F01B9
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2019 16:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389506AbfKEPmK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Nov 2019 10:42:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:47780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389032AbfKEPmJ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 5 Nov 2019 10:42:09 -0500
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2813121D7C;
        Tue,  5 Nov 2019 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572968529;
        bh=zTarLBomRWe/D55qy700HJpAMIzlix9mgs32YypD9jY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ydTuk0C5zNUzdS5sbR3OcQpPxZbRiOaV5Pfq1Ti0UCyQFieH4w+gH4HS3Ih71Ub4O
         xnxsXNClUWaTX4IQz5bJGhRrZkoaiOSjfZ30/m+GfgoZAwqbl2xh3UFO1A6M7zg7v1
         WATBruelLDThNZ1za+LGq+ZEnllqkufRAwdaKjls=
Received: by mail-qk1-f171.google.com with SMTP id h15so11802001qka.13;
        Tue, 05 Nov 2019 07:42:09 -0800 (PST)
X-Gm-Message-State: APjAAAUINPUuU4wGN4eIGzus1+pcGwJeAPM5QWMt9kULQ0FQPRB/0txq
        EMXjSZNlBJMEoL+kD3QQNC5fKGNKAbygjJFmzQ==
X-Google-Smtp-Source: APXvYqwCASegsJY8lXHRXGg3CEZzYiPMIfP7rj0yYrg3SPgwVhD/sedQrOjKxpitcJD9lkhC9AcNICxtVr9GhGXGfKg=
X-Received: by 2002:a05:620a:205d:: with SMTP id d29mr4980731qka.152.1572968528189;
 Tue, 05 Nov 2019 07:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20191031134833.241303-1-maxime@cerno.tech>
In-Reply-To: <20191031134833.241303-1-maxime@cerno.tech>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 5 Nov 2019 09:41:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0X3jqO2B4o9Md1Vo5jO9cSvioeLNLrge9aoSsm-4aLg@mail.gmail.com>
Message-ID: <CAL_Jsq+0X3jqO2B4o9Md1Vo5jO9cSvioeLNLrge9aoSsm-4aLg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: lm3630a: Fix the example compilation
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Oct 31, 2019 at 8:48 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Commit ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to
> describe HWEN pin") introduced in the example a GPIO flag that isn't
> declared anywhere, resulting in a compilation breakage when running the
> validation tools. Add the proper define.
>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Lee Jones <lee.jones@linaro.org>
> Fixes: ae92365cdd75 ("dt-bindings: backlight: lm3630a: Add enable-gpios to describe HWEN pin")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/leds/backlight/lm3630a-backlight.yaml   | 2 ++
>  1 file changed, 2 insertions(+)

Lee already applied a fix. Though it's not in linux-next yet.

Rob
