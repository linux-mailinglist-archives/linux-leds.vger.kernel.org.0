Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269AE1BA6D1
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 16:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgD0Opt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 10:45:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:57120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727881AbgD0Opt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 27 Apr 2020 10:45:49 -0400
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BCA020735;
        Mon, 27 Apr 2020 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587998748;
        bh=hzyH6N5EnDxhPKQQ5UvUR/8HV/kEX+gyqgaSd5fYiJM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a4HIWd9Qbyw7ELAfzbc7ggl1+0Nc3Xu00nmH0hlJk/DLP4Cs5Z6yM+hcMt0Nqk10z
         HStRqb76tx7vxWgQ88hK9ixXDfH9VNt4fIMsLVQ9HT60o5QNA8yP0b6QlFWDOJo+94
         HodFiwyK0j8+v/OLPGEvGRcFcpOvAVTJz/mtj868=
Received: by mail-lj1-f180.google.com with SMTP id g4so17885715ljl.2;
        Mon, 27 Apr 2020 07:45:48 -0700 (PDT)
X-Gm-Message-State: AGi0PubfHRjBE7ADB1goN1C6B9t76ezfXB+is3IECePQEJQJvSphZN8/
        zzmfcNOBSgZsAk2YBVwBuv13yIL5ekj9HLZFpEQ=
X-Google-Smtp-Source: APiQypIYAxuucnWJ+KLeLiZ/eZeN9zwsLRkWbBppV3NYP8NhxpBQLXs9ImaV6BNcc6lA42ZvRxZZcB46DK7wq1k5/iI=
X-Received: by 2002:a2e:2a82:: with SMTP id q124mr15173172ljq.155.1587998746563;
 Mon, 27 Apr 2020 07:45:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200427073132.29997-3-wens@kernel.org> <684132b8-4a84-8295-474b-38ccb992bba7@gmail.com>
 <CAGb2v66Piu5_2bdqvWV3eEn2Se_y1MNKWvvYBv_J7DA-8jBhbQ@mail.gmail.com>
 <65d15254-08da-895c-1a0c-ef6ce231b620@gmail.com> <CAGb2v65fGYguNoksq5Dyx3HTKeYg+U82TiQSL+NO8AUcQJQj5w@mail.gmail.com>
 <74a984fc-ce57-211b-936c-2d77e2e642bb@gmail.com> <a81840d3-813b-51b5-767c-e0d9d270200e@gmail.com>
In-Reply-To: <a81840d3-813b-51b5-767c-e0d9d270200e@gmail.com>
From:   Chen-Yu Tsai <wens@kernel.org>
Date:   Mon, 27 Apr 2020 22:45:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v65Gtm88MJTTw_MxB0sc8m5=EVzom7zw2Ro_UJgqjOQKkA@mail.gmail.com>
Message-ID: <CAGb2v65Gtm88MJTTw_MxB0sc8m5=EVzom7zw2Ro_UJgqjOQKkA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: rk3399-roc-pc: Fix MMC
 numbering for LED triggers
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        devicetree <devicetree@vger.kernel.org>, dmurphy@ti.com,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        jacek.anaszewski@gmail.com,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 27, 2020 at 10:12 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Hi,
>
> >> So for fixing up the LED node names, we'd probably want the following:
> >>
> >>     diy_led: led-0
> >>     yellow_led: led-1
> >>     work_led: led-2
>
> Change proposal for led nodes to comply with preexisting dts.
> Does this work?
>
> diy_led: led_0: led-0
> yellow_led: led_1: led-1
> work_led: led_2: led-2
>
>
> blue: led_0: led-0
>
> A check does not give any warnings.
>
> make -k ARCH=arm dtbs_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/leds/leds-gpio.yaml

IMO the led_N labels are kind of useless... they don't convey the
information needed to identify the device.

A reader seeing

    &led_0 {
        linux,default_triggger = "activity";
    };

in some device tree (overlay) has no idea what this snippet is supposed
to do. The person has to go back to the base dts / dtsi file to figure
that out.

But seriously, you should start a separate thread to discuss this issue.

ChenYu

> >
> > That doesn't look pretty either.
> > Would like to hear the maintainers view on how to handle other cases
> > without 'led' like for example 'blue' for mk808.
> >
