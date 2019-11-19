Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36DF4102D75
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 21:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfKSUWj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 15:22:39 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37667 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfKSUWj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 15:22:39 -0500
Received: by mail-oi1-f193.google.com with SMTP id y194so20281093oie.4;
        Tue, 19 Nov 2019 12:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EaTTkxHDmEcbt3U07gxobyJb6+sGwOBuoJv50bL/JxA=;
        b=RNYBUFvVJbWTpntO45DEDvG9rS5TKy6ZiEJVDCOo9tUG3s9Hz7h0Ve3T76zsFtyBNb
         1Hi5fdwg9mlhLGNCYbvu//6ptLxjVt5/cZSw/aaA7jZALCUCXnNiYE7AVny+LpCVy9k8
         LZB4SAQra2BE09vc5/a2VyQ6dTlLaEfZHBVBNKLXSD7P2BtY+bKNeJwK94GhSC9eEkla
         8ej+cQXGIjG8Owe9M1Tq2EPKbO45KhhMQsy8KLl78dm/8NvkediEjAxSePPJ4p8WFAU6
         iAX3bI0IF87KXPnV4tTHcP0OkN0Fb/iu1ZPGXGZfgEF6mJE/HnZtcdmnF3EhDoxc6Suy
         GlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EaTTkxHDmEcbt3U07gxobyJb6+sGwOBuoJv50bL/JxA=;
        b=suTtKMO+Z9m0BEMQYrCKjYiNriQ6fI0CckoJPifVpOMtUPUIKXiJpez92q07r1m3kE
         B6ZoRel6GH3Ag+npTz2/3Pm60Yp8O2D7pFuBl1mgKkZ6JgKQRy6XcAUwOaFfEQ1acH3z
         LFzHqXnsD/GyfdsOHLxDiShBDDkyAEmLFwk0Zbcj6pBDDL+RJfV6a82bufoQX4ApD3Vq
         rF7a8STXMN4proWDwbqw7jDV5hY9xcdBUbmErWSBbmbkLYTL7iFsQoq/2wfgMlfoEjPi
         3PlFRhsrxtL5RfAiJ0i7UlvtsZNV2C7qLXFr6ApYmwzwWZNV6TiGVWk1dLgtvbqe7AUK
         QFjA==
X-Gm-Message-State: APjAAAUS1h9Sqc1W9UvlNKzb/GLFNsG8NEFazHGh06V2BFsEun/BZMno
        m5P2NFShYWuj6hbV2NoNRmjc8LaO/ei3OpCJgvc=
X-Google-Smtp-Source: APXvYqw9UESCyKM+zUzYQlWNuuB5qfg03HMHFwEnI6OGKoFwxweBxCdAijIYWCJnQxNu51CFhAfe+j5UnT4j/aOpx1Q=
X-Received: by 2002:aca:4c57:: with SMTP id z84mr5651946oia.92.1574194956618;
 Tue, 19 Nov 2019 12:22:36 -0800 (PST)
MIME-Version: 1.0
References: <20191119154611.29625-1-TheSven73@gmail.com> <20191119154611.29625-5-TheSven73@gmail.com>
 <a37d098e-12ea-af2e-22cd-cb5ec2856b6d@ti.com> <CAGngYiU_8Obd6jKO9-fukK4K6hYYhFYVSjzxqVxVwwKeCmUkaw@mail.gmail.com>
 <b2ea6130-cfce-4d41-0b35-ba076f599402@gmail.com>
In-Reply-To: <b2ea6130-cfce-4d41-0b35-ba076f599402@gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 19 Nov 2019 15:22:25 -0500
Message-ID: <CAGngYiUDPc+xMO6zzr+bN=i7-QFTUaNE0P5iP+QELjRHnfqUsw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: mfd: update TI tps6105x chip bindings
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Nov 19, 2019 at 2:38 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> label DT property was recently deprecated. We now encourage using
> 'function' and/or 'color'. Please refer to
> Documentation/devicetree/bindings/leds/common.txt.

Ah, I see.

I'm actually back-porting this from a 4.19 vendor kernel, which I believe
does not have function/color support. If I introduce it here, I wouldn't
be able to test it easily, and I'd have to forward/back-port.

All I need is a single led in the system. So I'll just remove the 'label'
code/description, and hard-code the led name to 'tps6105x'. If
anyone wants to use this driver and wants named leds, they can
always add it themselves.

Jacek and Dan, does that satisfy your concerns?
