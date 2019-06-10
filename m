Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE433AD4E
	for <lists+linux-leds@lfdr.de>; Mon, 10 Jun 2019 04:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387548AbfFJCwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 22:52:24 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34943 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387496AbfFJCwY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 22:52:24 -0400
Received: by mail-ot1-f65.google.com with SMTP id j19so6970003otq.2
        for <linux-leds@vger.kernel.org>; Sun, 09 Jun 2019 19:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W/MfzJg7c9DX2ZNb9NjuMd10Rr7cerwvLZmvt7k7/+w=;
        b=rVZygW2PoODN+f8HdixyM+h03uiMRuiSR5mD4dSAgGV2NTHG1J/ywPnV41ybe4rEoo
         ITBwsxDeUNl8BG+5hOjA7njHpV0+kDgr9jmsDmJsA/WuICKLQSz/f2wvUApuEqx7vNWA
         iKYWp3VOVBtVEgrDWrjYU8tnxEH3I3eCOXk5LVK1Sx2cI1ICX82X1F6sQ5TP31H/4se4
         HTmWvQpNwAFfNKazu1DQ8I5VRYOiLclpaPT/DVzWCxRvYHo+MjZzODMxtvpzj6EKnlpq
         RVC/JSTqv0kX1sHW60YRJtjrxC/QBzVi9Uy80+0PQNLHIkeF2D/7vv4w+v/VQY+I5ft+
         8ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W/MfzJg7c9DX2ZNb9NjuMd10Rr7cerwvLZmvt7k7/+w=;
        b=VcsPe4W3mfEtnMhjMBXWolx/Fbh/bAAzS83ZmTFZsyPmu4VRE/lAL9eKOCO9LUtx8k
         OMCt1Auf39IWBFFKK0N+yGy3bD6qMC6RNdbDpvnjgI7s6Ut4IpxMrTWxqU4fO7dbpyxk
         YzH46iwvA9s1KVs3igNOEGkfyKhCQrNQbHIGo/o8Z7mbLaUhSopV5UqaDhfn201S38Ny
         g/F/hMAjAW5r3pM8vTYJXlJhQTyfLpuz5nzF9EWvqvpOuvEsJAI4vl04vC12NZVqa11U
         dib7PqiEw7tlHp1V5tL8UYY4t/DKfxblGpgRisE6V4LWXWkDNICSHttN29l8GCrmEflv
         eLrw==
X-Gm-Message-State: APjAAAWbSBxEu8dDVZDbpIFhGV69K9VzJ79tgjGMNmQjtzF/iJrSXPio
        B8Iw0oT7RQonSRzzMIRjpUbcz5scz9a6uF8q1GKraw==
X-Google-Smtp-Source: APXvYqxAimTcIhB0rhj7ECSrbtfm8vcFVwPFdfOqnhswkGX/W/CpCR7lAQcIg5CMKXUq/12QVu54SGP+weUrHpQLtLc=
X-Received: by 2002:a9d:10c:: with SMTP id 12mr28837859otu.123.1560135143789;
 Sun, 09 Jun 2019 19:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com> <20190609190803.14815-8-jacek.anaszewski@gmail.com>
In-Reply-To: <20190609190803.14815-8-jacek.anaszewski@gmail.com>
From:   Baolin Wang <baolin.wang@linaro.org>
Date:   Mon, 10 Jun 2019 10:52:12 +0800
Message-ID: <CAMz4kuLHxxDB2SrYZp5TWSk8ZFjiCWPaRX-r_=zpFy+-YM3WEQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/26] leds: sc27xx-blt: Use generic support for
 composing LED names
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh@kernel.org>, dtor@google.com,
        Guenter Roeck <linux@roeck-us.net>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Jacek,

On Mon, 10 Jun 2019 at 03:08, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:
>
> Switch to using generic LED support for composing LED class
> device name.
>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Baolin Wang <baolin.wang@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

-- 
Baolin Wang
Best Regards
