Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3091231C4DD
	for <lists+linux-leds@lfdr.de>; Tue, 16 Feb 2021 02:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhBPBMH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Feb 2021 20:12:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhBPBMG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Feb 2021 20:12:06 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4615C061574
        for <linux-leds@vger.kernel.org>; Mon, 15 Feb 2021 17:11:25 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id q85so8089166qke.8
        for <linux-leds@vger.kernel.org>; Mon, 15 Feb 2021 17:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4gSiVjnIYXX/80/CN+Tb+DJkgaEawWIULnBbNpT2ZEI=;
        b=hSzKVCmq1otybyU7+be+rbh/g0sjuurRiHO0NkBS8tWxkUUF3YcMnp+5KlaxdYRy1r
         LbIbKkP+HdG2UUxaBzqo50MdgsqTapHLVhnD3qKilrh65ampMhortVnDZncwM0M3ipjr
         aF+VBXxcBnRdVsjU437qLRkZ3EtihOAbvPk8C0Az2Dk/h8sGYRbYNu+Uuoj0b/t72FQG
         4YPaNWeFjcFTiv3ARdKvNVuHjQgIORiGYMD2xV9N+gzUAcXS3RrasKb+sFQ3woh+yC2W
         0B6Cu5f+oSeWYi3OwtC5m96oUbob3t/kss2BK/Xz24kDWn9m7+aTRNvqnyKzXfc1xs0+
         f5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gSiVjnIYXX/80/CN+Tb+DJkgaEawWIULnBbNpT2ZEI=;
        b=oAp8jROtigDhnZpCAxIRungu/tCervX4jq8W4iTwXckJlpwSzzQaGquN67sfsxizrq
         OOdSnhduVYemRI7veGOkKvw2cNAamP5L5zKrHoUc48IPzvGrlCeVOmnaMwjtO065f8YW
         hUiOjmCnuzx0xFa7dCrXk8P46URAGySXvG2IqtHA6KcmP6OD5dRFoBO1bpexaTKn59na
         EpLjup2s24HPWruRv8CmQbNzRUS6+U8aPC4zH3jAUC17OditHaCDuWBYVpfQuqqJTgeW
         irQAO4Z/MsHZZD0HIJe1pglwfmcKQ4h6ehsoF49IzDIiEHzqVnB5XKsL+IO5bPZrQixB
         ZgCQ==
X-Gm-Message-State: AOAM530sh9MWfJfUSsyymOWNWYAImjI3qzjEYZ+0QcQSp9nMu4erWWSl
        wbtJyyKuUy5ZG0AcxVtqWFicvADh6Y79O2FBZR7Y4b1nBhk=
X-Google-Smtp-Source: ABdhPJw2iW95NuTwpE/6V2X6a5jd81HWIFyp3uGCxiYAT5ltzNiD4uxtoNG9Tq3gY22Cd+nbi1DIWov3Ocr8PdUejpo=
X-Received: by 2002:a05:620a:6d1:: with SMTP id 17mr17594410qky.15.1613437885129;
 Mon, 15 Feb 2021 17:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20210215004549.135251-1-roderick@gaikai.com> <20210215004549.135251-4-roderick@gaikai.com>
 <CANndSK=52kV50SsDzhEg78m67AFhNoz=Z4H1=pFyHLzAJj-YBQ@mail.gmail.com> <20210216013337.284220cf@nic.cz>
In-Reply-To: <20210216013337.284220cf@nic.cz>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Mon, 15 Feb 2021 17:11:14 -0800
Message-ID: <CANndSKke4zGn2T6jC4xYtguAjixZ7n5Rf9SSY3knEhvwJ1cLyQ@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] HID: playstation: add DualSense player LEDs support.
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Pavel Machek <pavel@ucw.cz>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Feb 15, 2021 at 4:33 PM Marek Behun <marek.behun@nic.cz> wrote:
>
> On Mon, 15 Feb 2021 15:00:30 -0800
> Roderick Colenbrander <roderick@gaikai.com> wrote:
>
> > What is the desired naming for these player LEDs? There is not an
> > officially designed function based on DT bindings. So far they used
> > "playstation::mac::ledX". When changing the naming scheme towards
> > "hid" and removing MAC, they would be: "hid%d::led1" etcetera.
>
> Hi,
>
> there is one more thing I forgot to mention in the LED name schema:
>   devicename:color:function-functionEnumerator
>
> So LED core can for example compose a names in the format:
>   switch0:green:lan-1
>   switch0:green:lan-2
>   switch0:green:lan-3
>   switch0:green:lan-4
>
> In your case I think the most appropriate name would be something like
>   hid0:color:indicator-1
>   hid0:color:indicator-2
>   ...

I am trying to think if indicator is clear enough. Currently devices
use a mixture of names, which is obviously bad (wiimote uses p1-p4 at
the end, sony uses sony1-4 for DualShock 3, hid-nintendo uses
player1-4). I would at least like new drivers to standardize. In
particular in Android frameworks we have a need to map these LEDs back
to the Java InputDevice. Finding the LEDs has been quite painful so
far.

If this is what is decided, I guess we should update the Linux gamepad
document at some point as well.

> Are these LEDs of different colors which are impossible to determine?
> The string "hid%d::led1" you mention above does not indicate color.

The DualSense LEDs are all white (at least so far?). On controllers
from other brands I have seen them be red or green. So could indeed
use: "hid%d:white".

> Marek

Thanks,
Roderick
