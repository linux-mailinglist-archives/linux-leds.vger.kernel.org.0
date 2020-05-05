Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4441C4E4A
	for <lists+linux-leds@lfdr.de>; Tue,  5 May 2020 08:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgEEGYk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 May 2020 02:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEGYk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 5 May 2020 02:24:40 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 437A22078E;
        Tue,  5 May 2020 06:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588659879;
        bh=32C1+bQS5q6+j/8l19A7TyTRYN77WVbVh7KpTlSe7i4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VLK98zWjpJ7DE5THs3mA29Bq0s5miWiy9BzXVlZAhc+ses/cxYMXaVK441pdJJlNM
         LEVsEvqzpk0UiJ5YgX5WXSEBjm43Q9bmJeMvz7mEAhHehGOMM79pYm5GE9PwLi8uQl
         WudJ97DCBV9P9Q0z3mL3PhcNhFuHREMX48UznvJI=
Received: by mail-lf1-f44.google.com with SMTP id d25so378487lfi.11;
        Mon, 04 May 2020 23:24:39 -0700 (PDT)
X-Gm-Message-State: AGi0Pub3daSlkvwW9/peL7SF1SpDD8Nx9lKurQelYnVKGP1En6dZs77d
        GFgShDOSaSEpvY9yTfxmxdxVrL7COtlGowP0jJc=
X-Google-Smtp-Source: APiQypLIfMst1tqU1q00DeK98YpKK9mzmYw+EV1sJq0vvQCmBBobl8Z6eq/WglAR6rmBcFTqBtT7DYFqXPxaX4MtqcE=
X-Received: by 2002:a19:c515:: with SMTP id w21mr565410lfe.186.1588659877383;
 Mon, 04 May 2020 23:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200427073132.29997-1-wens@kernel.org>
In-Reply-To: <20200427073132.29997-1-wens@kernel.org>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Tue, 5 May 2020 14:24:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jPJA0hqXQg1Ufpkxt=7bqwoaQATRVuNg2AC5RZ9Os3w@mail.gmail.com>
Message-ID: <CAGb2v67jPJA0hqXQg1Ufpkxt=7bqwoaQATRVuNg2AC5RZ9Os3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: misc. cleanups and improvements
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Chen-Yu Tsai <wens@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

On Mon, Apr 27, 2020 at 3:31 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> Hi,
>
> Here is the remaining patch for roc-rk3399-pc, along with a few other
> new patches.
>
>   - Based on discussions from v1, patch one, newly added, drops the list
>     of valid values for linux,default-triggers.
>
>   - Patch two is the same as in v1
>
>   - Patch three, new, sets dr_mode to "host" to the dwc2 OTG controller,
>     matching what the board uses it for, a host port. This gets rid of
>     a warning from the kernel.
>
> Please have a look.

Are there any comments from the maintainers?

I feel like this is getting needlessly sidetracked by the endless discussion
about GPIO LED node names which I left untouched on purpose in this series.

ChenYu


> Regards
> ChenYu
>
>
> Chen-Yu Tsai (3):
>   dt-bindings: leds: common: Drop enumeration for linux,default-triggers
>   arm64: dts: rockchip: rk3399-roc-pc: Fix MMC numbering for LED
>     triggers
>   arm64: dts: rockchip: rk3328-roc-cc: Set dr_mode to "host" for OTG
>
>  .../devicetree/bindings/leds/common.yaml      | 21 +------------------
>  .../arm64/boot/dts/rockchip/rk3328-roc-cc.dts |  1 +
>  .../dts/rockchip/rk3399-roc-pc-mezzanine.dts  |  8 +++++++
>  .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |  4 ++--
>  4 files changed, 12 insertions(+), 22 deletions(-)
>
> --
> 2.26.0
>
