Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD0E262973
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 10:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgIIIBO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 04:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729298AbgIIIBJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 04:01:09 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8745C061573;
        Wed,  9 Sep 2020 01:01:08 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id r9so2213192ioa.2;
        Wed, 09 Sep 2020 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XofdRpK/NkNOwPn3C+UQHBTlj0f2ihnhjcjpsORpGg8=;
        b=V1OebJGJKe6lDiu9JKr0je3sMlGwKKkS2NX20512Txx+76F0SXyrUFjlo/MCwNuk4l
         HLEq/Sqccxqk7L1fGvD4mEI0I/C1c0xKHwR90buM84GYCOM116Fq8D21mwui91QUAowY
         bdT6ar1UTrgmQ2mgrtMPnbOnP/bYy/H0pf5WWlfYftDpqHR1nOw8v5Y8h9ko/OF3D9mu
         jrjzJwZKoPq+m+ntC0b922+fFAa8/axGvcZg55jMBfU/aMQC9bWEA+50knFEsBb6XdEc
         xqrRO8kzDSbPJ9FIqTUeu1bI83IT0D20NIZQHbZCw9/Dnxf2t7oGfQAyAmL1VIxE7RWB
         /PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XofdRpK/NkNOwPn3C+UQHBTlj0f2ihnhjcjpsORpGg8=;
        b=fQD3xS+R3yqkJPXnKh7pjk+K/KYSDYVzal/3/bjGS3LBPvrteHKgvVIIFgkCmjgTnE
         96UWILBPUtTX322U/Aq8oFBIwcLKUc6W2tUXY+fR+EzwkuDp+zqoivoIOz2RbyKdSzEo
         7V+DtQNXi8shXw9/QN/vXGGsSvUDC8hBIS5SPEcp8WtKYZ0chuk17/Mc/2ibmwSUB5Pk
         hTQfr8myucYuZJw7Fht5yLjX6DRX+OdJyd6hvuovis1j5lMQtlpfSCnDlarTnsMdr5yy
         bFzZXmOnzZsIyfqvVnbCEwBVoZhxopUtyC77dC0fiweN/qJcgD6th1J9JoGXeDTv7XQj
         P+/w==
X-Gm-Message-State: AOAM530C1OZNXd9w6Vcu6v5a4EG4N69yDqIHrF/UeYaPj0DylOHPkp5U
        12hKhOog67s+8064B0CNsWITpJ1cvpCF1L0MtsJsE863GKA=
X-Google-Smtp-Source: ABdhPJyRNbnMQgEd0sGWlFqNZ65UWqpRk1VGEzPh24kfY1R9J6cpzzZ12e/DQCuRJfoK+mZQiShNqFrRpmkm6YS5ito=
X-Received: by 2002:a05:6602:218f:: with SMTP id b15mr2335138iob.8.1599638468143;
 Wed, 09 Sep 2020 01:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com> <b8d090b7-ef47-d434-1af1-2afbc2ad30ae@ti.com>
In-Reply-To: <b8d090b7-ef47-d434-1af1-2afbc2ad30ae@ti.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Wed, 9 Sep 2020 08:00:56 +0800
Message-ID: <CAE+NS36MgRHzHpUEadZxguBxmO5+b4qBKo4AY8kvoG9Nj2wpsw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] leds: mt6360: Add LED driver for MT6360
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan Murphy <dmurphy@ti.com> =E6=96=BC 2020=E5=B9=B49=E6=9C=888=E6=97=A5 =E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:14=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Gene
>
> On 9/7/20 5:27 AM, Gene Chen wrote:
> > In-Reply-To:
> >
> > This patch series add MT6360 LED support contains driver and binding do=
cument
>
> I cannot find the v2 patch series for this.
>
> Dan
>

There is a little confuse of patch v2 which title didn't show the version.
I list the patch sequence as below

[v1] leds: mt6360: Add LED driver for MT6360
https://patchwork.kernel.org/patch/11586959/
[v2] [1/2] leds: mt6360: Add LED driver for MT6360
https://patchwork.kernel.org/patch/11737995/
[v3] [v3,1/2] leds: mt6360: Add LED driver for MT6360
https://patchwork.kernel.org/patch/11760491/
