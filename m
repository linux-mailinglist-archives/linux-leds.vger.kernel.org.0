Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851FE456F5A
	for <lists+linux-leds@lfdr.de>; Fri, 19 Nov 2021 14:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbhKSNPG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Nov 2021 08:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbhKSNPF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 19 Nov 2021 08:15:05 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55F3C061574
        for <linux-leds@vger.kernel.org>; Fri, 19 Nov 2021 05:12:03 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id p2so21040901uad.11
        for <linux-leds@vger.kernel.org>; Fri, 19 Nov 2021 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YM8iEZkWj09QdZV0IaAS62/GEXCOf5MjgxwudLjy2dY=;
        b=cAE33cfo/0N63eGgp8XbsF1lNvSCLdfZ1+2RAHHG4RaBBsTG0gitWfyd/tOn+UlXeK
         q0fSYiClNmlpIxW80wl8/1ziXRzBUdaZ6/JDoFb8RP4KfycfDQIdQvvNBvHrqVTYNaXW
         KT+I/Khok9hk9K03fe9/iYTO36bYC08uzLHs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YM8iEZkWj09QdZV0IaAS62/GEXCOf5MjgxwudLjy2dY=;
        b=Adh8BjEVyRPI0D8TevBY+aVMIYbQqi1LCkgaOYxG4WhU+7Lor4y5/4GeBM4IwCiSxv
         Vg//uKj7dmm0VJk0YmFbVULh4LwGDr1MAbx60FSDVoscYlLn9JsquNKm1bUWQLmRPysl
         RYYgHvayaaFdZEP4K4l8aed9jkYtDtAd2vCm6hPm0pJU77005B3OT9MAb49YVJDEKWj5
         tC5vXQeczlz2AWd6yV3s7+FDr0wndKBRvhIeXVRdD6/RpJK8kKCE58sYMlCxicjuY45t
         jeyThdQ7eJHM8XqQXN9lWiwpbkJ+RBTAj/J5t37jjljXN7HyUVU3QCRqdqtkHgyKdKyT
         Afug==
X-Gm-Message-State: AOAM533ls17+FdfBxHdUH0W3vgEVXCBhsJhttDnT7t00MkdcTQQs+vM+
        daotxIdPt/uvP9m6XI2MO56cGxHaLw2qruw3BmDiig==
X-Google-Smtp-Source: ABdhPJx8ZxQW/Y4NgqCFDWKYKJOnuOnviKck4eVR5XbNzsqnkFWtVWE2YsNzXL/5+5sd4UipCMXMaZBVMVKVdagJ3lo=
X-Received: by 2002:a05:6102:38c7:: with SMTP id k7mr87839688vst.45.1637327522660;
 Fri, 19 Nov 2021 05:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20210923065500.2284347-1-daniel@0x0f.com>
In-Reply-To: <20210923065500.2284347-1-daniel@0x0f.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 19 Nov 2021 22:11:52 +0900
Message-ID: <CAFr9PXmPE_vRcHgPkJp3o=d5HnAV52TFuBe-2hf=hKY8y2=BhA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] gpio: msc313: Add gpio support for ssd20xd
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        pavel@ucw.cz, DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Romain Perier <romain.perier@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Bartosz,

On Thu, 23 Sept 2021 at 15:55, Daniel Palmer <daniel@0x0f.com> wrote:

> Daniel Palmer (11):
>   dt-bindings: gpio: msc313: Add compatible for ssd20xd
>   dt-bindings: gpio: msc313: Add offsets for ssd20xd
>   gpio: msc313: Code clean ups
>   gpio: msc313: Add support for SSD201 and SSD202D

Would it be possible to get some comment on these commits and/or get
them picked up?
We (Romain and I) have a few bits that are blocked on this.

Thanks,

Daniel
