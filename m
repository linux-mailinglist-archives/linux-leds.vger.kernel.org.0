Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61CC3372419
	for <lists+linux-leds@lfdr.de>; Tue,  4 May 2021 03:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhEDBF7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 May 2021 21:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhEDBF6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 May 2021 21:05:58 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64655C061574;
        Mon,  3 May 2021 18:05:04 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id u25so9110039ljg.7;
        Mon, 03 May 2021 18:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r9D/Vv46NFUDS7eEuuQgoKUOv2tmGGOdBAwQyrDcRjQ=;
        b=UxDctmF7VvjRqvdlfyHMqNtpKHFRKap27sX97KfPpVoeIPDxGsVw1OYBYVdm/L46RI
         mA95gpLDg+C2PlFRKB3QTF9Tn0jMCV1C4GS2XiPGbANUTpFgeIHrTOQHP5aFycX5yzlw
         ZtikYubAOE1fjVTnkFss3IopJFRP6Rztzg0aelsRrR8Nd4c9j0itS4xQJFjJ/xxZoJeg
         G3an5vGGWDam5tgKt5NnI+GO4j7q4SprGw8beLUBt+6ejuOr2J8W3cjXabIye1x6NvyN
         6yyjNr+DKoPLNjFfOUErDqRdQFmp+ZLM+ZzKrsO0g1lzT8KUgC0Zi0JNgXzHBZ0+Ioy0
         ZvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r9D/Vv46NFUDS7eEuuQgoKUOv2tmGGOdBAwQyrDcRjQ=;
        b=VGBJ+dXFvhjTTxc6SDt9rWmjPMLswq+U4OyDsxB/K5lS58MygAcRSBN1cGrJndxky1
         8EMy26hJALt+F5YqLp1tl0NEfSQysdeuZGKsXiJJM0jhWQwRAirpXmgyhhBs1zPqgfqP
         dbKl9D6wBLXPArxTJXP2P5CkVwRGsiaXj6vDZuF1bWAhngf6OGsauH4fIq8gsPWa2UX9
         qNoEjmRyq8aooHZcTIfThqvYAB9sB3YR2emSyPJxySImIk4aRnrbWGyTd70TgpDeGg3J
         hgbrWHR4iMQdaWtu0EwmT3ImR9qk1DgyQAayujQ1vgGJa/ezb9mVwJeXHouFMRCN4nUx
         ZcOw==
X-Gm-Message-State: AOAM531KtYYeIfqzJzRF+VCK87KARTfBYZ1xFNXQRJtv5BMesY11favN
        9Tblh2qXPdpm9Uk9YfWyaL3SPg1fO+QnC9tNFZG8G+PfXWc=
X-Google-Smtp-Source: ABdhPJzAZ3RjpbIHD2cbAWNsd/YGWoRRNdDV4/3/bb7xfoEpcaVivxBQIxquPZHLE0/2FfsQfCnw0959+31Ihtfub2Y=
X-Received: by 2002:a2e:9656:: with SMTP id z22mr6658800ljh.168.1620090302762;
 Mon, 03 May 2021 18:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <1619421491-31494-1-git-send-email-u0084500@gmail.com>
 <1619421491-31494-3-git-send-email-u0084500@gmail.com> <20210430201054.GA3805118@robh.at.kernel.org>
In-Reply-To: <20210430201054.GA3805118@robh.at.kernel.org>
From:   ChiYuan Huang <u0084500@gmail.com>
Date:   Tue, 4 May 2021 09:04:51 +0800
Message-ID: <CADiBU3_Nvx99yhukNVgmyiZyAugiVF7OfMoqudUM5_gk8GpPRg@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 3/4] mfd: rt4831: Adds DT binding document for
 Richtek RT4831
To:     Rob Herring <robh@kernel.org>
Cc:     b.zolnierkie@samsung.com, lkml <linux-kernel@vger.kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        lgirdwood@gmail.com,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
        linux-fbdev@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
        jingoohan1@gmail.com,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

HI,

Rob Herring <robh@kernel.org> =E6=96=BC 2021=E5=B9=B45=E6=9C=881=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=884:10=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, 26 Apr 2021 15:18:10 +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Adds DT binding document for Richtek RT4831.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> > Resend this v6 patch series to loop devicetree reviewers.
> > ---
> >  .../devicetree/bindings/mfd/richtek,rt4831.yaml    | 90 ++++++++++++++=
++++++++
> >  1 file changed, 90 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/richtek,rt483=
1.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>
Will merge in next v7. Thanks.
