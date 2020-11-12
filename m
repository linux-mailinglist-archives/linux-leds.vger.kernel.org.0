Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41F42B080D
	for <lists+linux-leds@lfdr.de>; Thu, 12 Nov 2020 16:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgKLPEL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 12 Nov 2020 10:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgKLPEL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 12 Nov 2020 10:04:11 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A68AC0613D6
        for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2020 07:04:11 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id l10so6521091lji.4
        for <linux-leds@vger.kernel.org>; Thu, 12 Nov 2020 07:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PqQlHiuYUatfOqpgijrt0IA2zZaSoWtcPhGii9yQJ5I=;
        b=jh4/qQF+3Diolsbr2KAyPiWXD1jmAv6Z9OcymVmeaPhJYWpAgWyxJl282YoiV/PYoH
         wVIunQqKv491Fl/qunTQ4wQwO7KMoBUFFSWqGYWTIQrwHWvfjwD2hspJotJLQDx6nHxO
         yG3rLvzt6szYGM+xqL79fPVynvPWNb2vTFhJqNgPamPSkDDlM4Ix/B/6frcCGthFR2/p
         Ky92rkG/G6K2Rt8vXFRlKEzEHl3LU/fVCxWjW8a84UBsjBu+784ip7GFqfBCKOSrpvRw
         iAe63/hVPtAUE38MoXwG9owLNwfPX86PUALzV4mUekN7Tm4+6SiKrdi/OHNXec5979wc
         ulGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PqQlHiuYUatfOqpgijrt0IA2zZaSoWtcPhGii9yQJ5I=;
        b=M2Dtbzq60v59TC3GIyISH2ta8bhkWb2tzzdtDN6JzOGTlwZLlIIvg0xY3aObzjA0nQ
         DdwF4Y4Cps57bcZ6OaHqRHN6Qsab1hcc+WGrI/lyrB7LK1U5wvBvzZoeSvgiZsDlpdxq
         RgjT/6fPCROVINrG+RVEriC10vNNLEg0GM2AlUSd5dDkZtAh855uie9rg3xjr+FJN/o1
         HH7SsccTkdUCzpsCe/d5X0qeQjQqQlg7SDUfC0sYXkb90Zma3medekjqapXVUmVtgYBJ
         qp6lJ77naOLfjNmnATG56/sujY5bD/Q40ZKeTa7w7fjP2xi4WaHZVQURayeW438HGqNt
         BPVg==
X-Gm-Message-State: AOAM5304ykV6JUDPiA0PWryVCMYAJvQivkQ895BdzYCjFMuwbj3ybFKP
        qbVrhTyiUCkaqsKQPgqGyZSL6bTC4aBk8WlBMDBVUg==
X-Google-Smtp-Source: ABdhPJzmhGR8JAFRuT8nxqoTnfgPvAXeagFyA/3/N21escorOKerGh6l6tFqSn5Ew3fmCBTMp+rsY73VhtG2MflPQWI=
X-Received: by 2002:a2e:8604:: with SMTP id a4mr12978622lji.100.1605193448120;
 Thu, 12 Nov 2020 07:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20201112115646.2562467-1-linus.walleij@linaro.org> <20201112145846.GA3588803@bogus>
In-Reply-To: <20201112145846.GA3588803@bogus>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Nov 2020 16:03:56 +0100
Message-ID: <CACRpkdbciyjbe6p-ckvXezyVvaExgdq8T2soqAhVPQQpCWmFpA@mail.gmail.com>
Subject: Re: [PATCH 1/2 v4] dt-bindings: leds: Add DT binding for Richtek RT8515
To:     Rob Herring <robh@kernel.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        newbytee@protonmail.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, phone-devel@vger.kernel.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Nov 12, 2020 at 3:58 PM Rob Herring <robh@kernel.org> wrote:

> My bot found errors running 'make dt_binding_check' on your patch:

I have a real hard time even testing YAML bindings after updating to the lates
dtschema, I just get so many errors from all over the tree and then it stops:

make[3]: *** [../Documentation/devicetree/bindings/Makefile:59:
Documentation/devicetree/bindings/processed-schema-examples.json]
Error 123
make[3]: Target '__build' not remade because of errors.
make[2]: *** [/var/linus/linux-nomadik/Makefile:1364: dt_binding_check] Error 2
make[2]: Leaving directory '/var/linus/linux-nomadik/build-ux500'
make[1]: *** [Makefile:185: __sub-make] Error 2
make[1]: Target 'dt_binding_check' not remade because of errors.
make[1]: Leaving directory '/var/linus/linux-nomadik'
make: *** [ux500.mak:573: check-bindings] Error 2

Is it necessary to run on linux-next to test schema/DTS for the moment?

Yours,
Linus Walleij
