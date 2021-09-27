Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A65C41A34E
	for <lists+linux-leds@lfdr.de>; Tue, 28 Sep 2021 00:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237983AbhI0WvR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Sep 2021 18:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238008AbhI0WvR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Sep 2021 18:51:17 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2187C061575
        for <linux-leds@vger.kernel.org>; Mon, 27 Sep 2021 15:49:38 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id b15so7726841uaj.5
        for <linux-leds@vger.kernel.org>; Mon, 27 Sep 2021 15:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l3Govj1Ggv6fnK3dXfFXh4R4w4mAAKZUo/5Lt6qGfhI=;
        b=Iq5vAXCv2EMz7F+Lo3dTfVrteNUNq7v81PHVhbhOsX5XpUjjgXfRLR72Oozo+4Rd28
         avv9yUHE6tuOtdTZvzc9WXaYi+m9yRhkz0esk2t4hBvj2j9/iNMEYnDKiLQv27KlzGnU
         KNtCEtConX/KW5Z8fpL4XbTssq9e8C35PemeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l3Govj1Ggv6fnK3dXfFXh4R4w4mAAKZUo/5Lt6qGfhI=;
        b=B2gMFyVJ4LvHU7QyUy77f+Age9L0ckF0KMvB3EfsEfu1mZl3f2qxIU+FgTE/b5xrNo
         f1tDsr8C1Dp+K5/B8wTkk7SjXKkQedxPNE/u5P9KC2fPo/UyGz4kEl89yFXId481bqGc
         Z4EzFmv5KbyBQhEEcYI3insDufrNVmGXFi2GEiTqgt10obKCyFvZN5EF4NUw8KWlemRB
         FG+6eTMKnvkedO4QJttcuEnOHw3rvBHuyTs77/L4ojNvZtkoYm11h5m1lkU3LlKrB6ux
         kOIwZZQPUMaYOVJ08+5jyVU0mJdirq7t50Fv56LF+IINdrUHoxGP0SJ8hpGxc1i+wPXk
         xk1g==
X-Gm-Message-State: AOAM532mT0S8o2ZlQ0a3t5PmAVQ8UXlJOkQMLx35pckzc9g7xZklUrMs
        rOyyBGLtFFV4I49Gs0alaPSb7gj0KwsUKrWvnF2/Ng==
X-Google-Smtp-Source: ABdhPJw93xHWEfPQbedVUspaJQ+Kpz4lDjxMsiLCz9VQF0pLxWLXngzwY9I3WjVpCLk0lSx8d9/HMX6++hBMj4ge2eY=
X-Received: by 2002:ab0:8c1:: with SMTP id o1mr2454160uaf.113.1632782977502;
 Mon, 27 Sep 2021 15:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210923065500.2284347-1-daniel@0x0f.com> <20210923065500.2284347-4-daniel@0x0f.com>
 <YVIhEJCJ9lr3ZKzM@robh.at.kernel.org>
In-Reply-To: <YVIhEJCJ9lr3ZKzM@robh.at.kernel.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 28 Sep 2021 07:51:40 +0900
Message-ID: <CAFr9PXnowBM-jAh4cnnngR00eJtB+dXArpircntEth0TU0UnjQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: leds: Document "activity" trigger
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>, pavel@ucw.cz,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Rob,

On Tue, 28 Sept 2021 at 04:52, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 23, 2021 at 03:54:52PM +0900, Daniel Palmer wrote:
> > The "activity" trigger can be used as the default but it's currently
> > undocumented so validating a devicetree that uses it causes a warning.
>
> It is preferred to use 'function' and LED_FUNCTION_CPU. Is there some
> reason that can't be used?

LED_FUNCTION_CPU seems to be tied to
drivers/leds/trigger/ledtrig-cpu.c which I think serves the same
purpose but does it a slightly different way.
Would adding LED_FUNCTION_ACTIVITY work?

Thanks,

Daniel
