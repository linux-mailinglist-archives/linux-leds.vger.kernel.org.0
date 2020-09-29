Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8330127CEC1
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 15:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728675AbgI2NOQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 09:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728394AbgI2NOQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 09:14:16 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A8DC061755
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 06:14:15 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z19so5473687lfr.4
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 06:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=piitBn56RFrmTdzxKCgKMNMaG7buUtqj3U42tB2+R4o=;
        b=IyfH3BiA5+wCdKa78wiauvoqqjIP0kgktaFhQDORIlk135uvO+yH9+O759+Jh4KoVl
         StMrJQzpS3a6Z/XwYLdCLO4BkX6S8cZOSHC3B9gjano+pB4G8s9l2Iu5m0upEISh1Zap
         xJrWF04vvjmyzVD+UM54WcU1aWBeECKkm2WhIpLzfdHiVHX1N0me93/CWFaY5UzGJZ5+
         lIuYDE881RWZJPCQ2RKIXXo5VoBb97bpEfOm0aZlLHeY/AIujZl5wtMDO8mRizVxB93o
         irM667NOqXeL7MkxlmHDQiUPpdXYjSYmleUZpuUHASkyHUWGegY32wUO1tcPqSIobt2H
         s1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=piitBn56RFrmTdzxKCgKMNMaG7buUtqj3U42tB2+R4o=;
        b=WFcgrVRF3fJ8zjyFSeom1ObTd8d3mOivztygHj+4AKdRgnV/ft24CFNTN8ODUKIpLu
         mZHweBD1NL5J9UACeqeqnEv/97kmB8869Pi56qSNP0vrfijKIsC8CET7huVygyy47eCp
         3PMD/ngOZaEIe9trqKDlUKshQxajaJ3bn86ody1YqShsrhVmv5dMUw4Mltk3+GecwKtq
         QXHV1QwBClItDPoY/g9NEuBbunjqpwUA7faJ+bH19U5FIXARnwoZIBWkXWv5ROPpMp0D
         656MXQazOW1vChzMohT0yePvGPA2lkNbL664DSwrANGEcMc5HLiL+H1CLcc3U5buxL0E
         vG0w==
X-Gm-Message-State: AOAM532GQXIurAMVbjd9/LVVg1G2dqFVqEVRg39cRtK2b+60q/fVxLCl
        UT2SQqMBDC/Xx6QZBbdv0t3OUbP9bPYNNKX8Higl3x+l9RnD/Q==
X-Google-Smtp-Source: ABdhPJxY4OEBdIMXAC+O0qUm0tc5dMP1R9SEC02dP2BrQkPZJ3RAutobx0kzrmLiGeQblFQgjQNjRRJWB1Z5bZVzZiY=
X-Received: by 2002:a19:6419:: with SMTP id y25mr1128689lfb.333.1601385254443;
 Tue, 29 Sep 2020 06:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200917223338.14164-1-marek.behun@nic.cz> <20200917223338.14164-21-marek.behun@nic.cz>
In-Reply-To: <20200917223338.14164-21-marek.behun@nic.cz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 15:14:03 +0200
Message-ID: <CACRpkdaQSQYNECsH=W4qsS2J3+iyWrgPxgC1jRpVMYRqyZaYkw@mail.gmail.com>
Subject: Re: [PATCH leds v2 20/50] leds: pm8058: use struct led_init_data when registering
To:     =?UTF-8?B?TWFyZWsgQmVow7pu?= <marek.behun@nic.cz>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 18, 2020 at 12:33 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrot=
e:

> By using struct led_init_data when registering we do not need to parse
> `label` DT property. Moreover `label` is deprecated and if it is not
> present but `color` and `function` are, LED core will compose a name
> from these properties instead.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>

For this and the other PM8058 patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
