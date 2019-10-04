Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30C6BCC4D2
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 23:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbfJDVat (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 17:30:49 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35190 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfJDVar (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 17:30:47 -0400
Received: by mail-lj1-f196.google.com with SMTP id m7so7910765lji.2
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2019 14:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=30N0F6xZkQAgSZ8aW5ffuxhZ54+WqTjFPcXbUil6TY0=;
        b=YlthOAKY4/GurKfM/rr3pytlsYy/kNaqjmR+PYpGEGdgMBoaSG+I0BQnoJk3/8MMzR
         b2NDX1DWrB0GQJDUew5mAIiRW++81llyR9g5wP07+kE2V8RKaFH1I+5MbhNizoA0eIVr
         1BCpPhL6/jj2XOmL6u4RYJGPjFxV1AQTpTTql4bR5G4DBxktftNHBhzhzDY9dCHjfd1i
         uWaMZyHHAg4dyndrl54N9ZSm5Ja+OT7CZ8ceDGrZgRYsqPcVtPbCohwWXHOiKPLWIqGw
         Gu75Xy2jkcE4qGgghoxGkm4HsfhBFz5d/2PUwihmHPWEtCl49vJYObFD9yJzD0uGntyp
         d+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=30N0F6xZkQAgSZ8aW5ffuxhZ54+WqTjFPcXbUil6TY0=;
        b=IeKOJGB6cidHHN++8S0l3CPNGEQ7cye5tm/aJqwpAyXJPPyHBl9gQabJScljGqmqjw
         ECOgC+zN7/lJ5jUg+CudLWrW6D+7l3ft5Um88PLeq2gDnG6WEE7/qE6lWjzkkgkgzlgo
         ezxFrSbUuS21yiYjUQ8ExomULlZHsvLWvJTWnvSqV1Uf/yory7rsJrQyQLwHd72uz8zS
         AVhXuPy5MzErzb7t7LlNQl+WGB+NonTQ7pEAUA3V9QGY19cgNk3ty8TvftogAtEAaDAT
         vNowGIAaUegsBTbrzg0cceE9vcL30DuA5C8M32XnUFQ7H6m250sHwmuRZKBhkjQ4N4Rc
         3+wg==
X-Gm-Message-State: APjAAAUAIFzwckFEyLyw9w2PJPjYXiDxZfzuEFuhmeio6QGra84cDLNk
        cHHJIhgpw8cUvpC/AUOlotWT2XPxxzZlHp9l75kxGA==
X-Google-Smtp-Source: APXvYqy/p6mrPUDNniNkWrn12mJfiUEtSVqoiFqJCR0bkshlJeLjUdKl+YYWnhsGhmCU1CwQpuFCq82MmXOSS9saEcY=
X-Received: by 2002:a2e:63da:: with SMTP id s87mr10556130lje.79.1570224644299;
 Fri, 04 Oct 2019 14:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190925174616.3714-1-dmurphy@ti.com> <20190925174616.3714-13-dmurphy@ti.com>
In-Reply-To: <20190925174616.3714-13-dmurphy@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Oct 2019 23:30:31 +0200
Message-ID: <CACRpkdYiNgv9gWWPEPcdDuv-xjohWUgnRfRLF8TZoO11nZX+=A@mail.gmail.com>
Subject: Re: [PATCH v9 12/15] ARM: dts: ste-href: Add reg property to the
 LP5521 channel nodes
To:     Dan Murphy <dmurphy@ti.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 25, 2019 at 7:41 PM Dan Murphy <dmurphy@ti.com> wrote:

> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Linus Walleij <linus.walleij@linaro.org>

Patch applied.

Yours,
Linus Walleij
