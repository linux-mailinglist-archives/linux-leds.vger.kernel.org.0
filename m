Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D8A3D30D
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2019 18:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391127AbfFKQzp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Jun 2019 12:55:45 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33781 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390991AbfFKQzo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Jun 2019 12:55:44 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so6491406ljg.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Jun 2019 09:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xh2IY7LpPfFuCqJ10WrTcz/y2fuRKJsYuYIzkRCHPGA=;
        b=vVUnEDJygjVhekQktjlLFhfyt/TULR2B1WfScNaOoGloNtpx2vfSiB+G/CX3eORLjT
         G7uF00KbXWKOgLrCKFt2ElbyKKBj7UGNgE3qSHyMqY1a5Pa6JO/asgQ3eA4cH2tjTbLT
         OnpX7Y6Nw5edKDsZjSnlBYS1OHSqLontrnYzE63pocD3JELJy7J5TX9sG+rAYqz6B7nH
         o31JpQJKjJ3i6cU94KGEX+LHAhEnu1SQbIJRdRL3AFvCLg6Fs9JqU3ncjsO/6Wj/3JJs
         8NebdMponYEqEN0JgIaeIZuEAsJNMsc0V5wQwraKtCbq1vonKbi6AjJIAE2oeW3Lo5OZ
         /Ajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xh2IY7LpPfFuCqJ10WrTcz/y2fuRKJsYuYIzkRCHPGA=;
        b=ldyDUIJwUJ1qDiZY4AfbQdsm/o4JIuMLvOWXWKrSDeYHswyt+VpNzwDVTwfqEdK9WE
         fgeZuDXfuZ93qyEAIU+VZCb2qCLUf4rvj4L+Z0aLUTvYIglfqifV7jBOmjgzcOCE7qE7
         LcBKQx10hLMVSZsG1dSUgz46Ot+9BfXpExYjQz/TrZkLY5dUaA0zrE0OwavVf40bRuk1
         66Fw/QSIv2Fg4jDau/BfTwjLRnnoYBSuheZ05O586XNC0G8lZUr75DlIECC/AD+YGVTQ
         wOyGE4zP1I27dHqta6jJH6cvDovGsiXUSVkJSb1xwA8YvQ7gpwCXjOK7MQOC2vH69tMX
         ZX2g==
X-Gm-Message-State: APjAAAWaO1OpbWU8sf66Hon61E/FYm5o4576BtAnmXJlo+I1U6YkFFVv
        zRKzZbBLyMZa41JR/nuTR6UVkI9jgrGpJBXVg4F64w==
X-Google-Smtp-Source: APXvYqw34lPSRZEgkGFHqW2B5EX/1BVK1usgV7bVySIzKQ01HlDt6hTtvz7UkvAtJxHIArPRYUa8+lvbvTxpux61U8A=
X-Received: by 2002:a2e:2411:: with SMTP id k17mr11738029ljk.136.1560272142410;
 Tue, 11 Jun 2019 09:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180208113032.27810-1-enric.balletbo@collabora.com>
 <20180208113032.27810-4-enric.balletbo@collabora.com> <20190607220947.GR40515@google.com>
 <20190608210226.GB2359@xo-6d-61-c0.localdomain> <20190610205233.GB137143@google.com>
 <20190611104913.egsbwcedshjdy3m5@holly.lan>
In-Reply-To: <20190611104913.egsbwcedshjdy3m5@holly.lan>
From:   Brian Norris <briannorris@google.com>
Date:   Tue, 11 Jun 2019 09:55:30 -0700
Message-ID: <CA+ASDXOq7KQ+f4KMh0gaC9hvXaxBDdsbiJxiTbeOJ9ZVaeNJag@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] backlight: pwm_bl: compute brightness of LED
 linearly to human eye.
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, Pavel Machek <pavel@ucw.cz>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Doug Anderson <dianders@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alexandru Stan <amstan@google.com>, linux-leds@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 11, 2019 at 3:49 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
> This is a long standing flaw in the backlight interfaces. AFAIK generic
> userspaces end up with a (flawed) heuristic.

Bingo! Would be nice if we could start to fix this long-standing flaw.

> Basically devices with a narrow range of choices can be assumed to be
> logarithmic

That's (almost, see below) exactly what we have.

(And this is what Matthias is fighting against, now that we're
implementing both "large number of data points" and "pre-curved" at
the same time. We will have to either adapt the heuristic, or else
adapt our device trees to fit the heuristic.)

> Systems are coming along that allow us to animate the change of
> brightness (part of the reason for interpolated tables is to
> permit smooth animation rather than because the user explicitly wants
> to set the brightness to exactly 1117).

Chrome OS has done this for a long time. So "coming along" is a bit late ;)

Also, I believe Chrome OS will do animation/smoothing for all tables
(small or large) where it can: even for the small tables.

> These systems are often
> logarithmic but with a wide range of values.

NB: Chrome OS happens to use a polynomial formula (exponent = 2 or
0.5, depending on how you look at it), not logarithmic. You can see it
in all its (non)glory here:

https://chromium.googlesource.com/chromiumos/platform2/+/ee015853b227cf265491bd80ccf096b188490529/power_manager/powerd/policy/internal_backlight_controller.cc#451

Regards,
Brian
