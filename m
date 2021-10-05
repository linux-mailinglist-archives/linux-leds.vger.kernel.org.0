Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D322B42222F
	for <lists+linux-leds@lfdr.de>; Tue,  5 Oct 2021 11:22:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhJEJX4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Oct 2021 05:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233372AbhJEJXy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Oct 2021 05:23:54 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF16FC061745;
        Tue,  5 Oct 2021 02:22:04 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id u20-20020a9d7214000000b0054e170300adso8073otj.13;
        Tue, 05 Oct 2021 02:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tWCZQD/n7Y/MgcB3b8Xhms8A/Xp3yZnIB33cQunaJpA=;
        b=DMLjnX/74Mmwlgz+PWs9+YyvNesESpEOSL+UBtJ0nZCNA/+sRYXzUC4cz6+mQ7s2jM
         3hZZRmijiO2DNDEyqWJ3DIpB7r76CI2puzWl3GsDSWwqmI1XeoM9ACCPmHxCOtW07uTP
         Q2Yalt8sxWh1miz6aAZzGoKPilA9BY3s+utTWi6CrZ/VVsOGX6idB0qO653py/zPiV4E
         utyqxxCFRTx15JcGNGES0NdhqX7rd1PfXiF3WpU3Piiq9rPLhIYEBaTmGFjn+j8G9t8Y
         3FY1M8kmD6g26Ur95pbCft9lDW5cwG4EKjZwEciUstcmoQhW2yMfXimNj/mXVDgYi2SR
         H7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tWCZQD/n7Y/MgcB3b8Xhms8A/Xp3yZnIB33cQunaJpA=;
        b=l5yLvqzYbxmMCD4XwyF4GJOrWj+tNEFy8iqqoYOvMXLc2ocuzYChsvElw3kjPSmgQ3
         wfI23oBMWCk19gv+nlky31AIrpzn4LHDFE2ZR/6Ej4tbOxn1+1/IpkUUwlne7qi5cXCc
         TVQYYk7zB/nMnAxX2/ihytcW7j+w8wbPz1xto2DzxnBEA9U1YAf6HNccFKZRRpu7TjXQ
         gmGHzRaLTbVKYyREUIEmOmWMMmlAh3d2vD2R0EwCN6fuLihUETDaJQKSHGpWUTxbtzp2
         QrzvanWpFPTyo7Avr17MJ/MG2lL3Afn1b0qsaJ2Ea5wGF1RKnm/sLgITUPYpZs23zZ0Z
         KcWg==
X-Gm-Message-State: AOAM532xgaJylh2pnfDzCYcsUsoeqn9ChfDyJnRrazf49RaX5AzXrY4L
        aB8Zz9uG8QQ1cNs1bHDUTzMiLtG3tI/XytSG8y4=
X-Google-Smtp-Source: ABdhPJySkyUchFhBsS+LhyiT2FdEMBCSVCBcLM6/3/d6uMy6yPQXdSF507crN5NiDrG5e5EaH1qzyZ3n9T4+pCLI2SA=
X-Received: by 2002:a9d:3e15:: with SMTP id a21mr13699450otd.60.1633425724166;
 Tue, 05 Oct 2021 02:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
In-Reply-To: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
From:   Gene Chen <gene.chen.richtek@gmail.com>
Date:   Tue, 5 Oct 2021 17:21:55 +0800
Message-ID: <CAE+NS34qtKgQYiCLQDupLK8L84SVS9EsztOpQFtS_CoOPzNwzQ@mail.gmail.com>
Subject: Re: [PATCH v15 0/2] leds: mt6360: Add LED driver for MT6360
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        ChiYuan Huang <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gene Chen <gene.chen.richtek@gmail.com> =E6=96=BC 2021=E5=B9=B47=E6=9C=8816=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:33=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
>
> This patch series add MT6360 LED support contains driver and binding docu=
ment
>
> Gene Chen (2)
>  dt-bindings: leds: Add bindings for MT6360 LED
>  leds: mt6360: Add LED driver for MT6360
>
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 ++
>  drivers/leds/flash/Kconfig                              |   13
>  drivers/leds/flash/Makefile                             |    1
>  drivers/leds/flash/leds-mt6360.c                        |  910 +++++++++=
+++++++
>  4 files changed, 1083 insertions(+)
>
> changelogs between v1 & v2
>  - add led driver with mfd
>
> changelogs between v2 & v3
>  - independent add led driver
>  - add dt-binding document
>  - refactor macros definition for easy to debug
>  - parse device tree by fwnode
>  - use devm*ext to register led class device
>
> changelogs between v3 & v4
>  - fix binding document description
>  - use GENMASK and add unit postfix to definition
>  - isink register led class device
>
> changelogs between v4 & v5
>  - change rgb isink to multicolor control
>  - add binding reference to mfd yaml
>
> changelogs between v5 & v6
>  - Use DT to decide RGB LED is multicolor device or indicator device only
>
> changelogs between v6 & v7
>  - Add binding multicolor device sample code
>  - Add flash ops mutex lock
>  - Remove V4L2 init with indicator device
>
> changelogs between v7 & v8
>  - Add mutex for led fault get ops
>  - Fix flash and multicolor no-ops return 0
>  - Add LED_FUNCTION_MOONLIGHT
>
> changelogs between v8 & v9
>  - reuse api in flash and multicolor header
>
> changelogs between v9 & v10
>  - add comment for reuse registration functions in flash and multicolor
>
> changelogs between v10 & v11
>  - match dt-binding reg property comment to the functionality name
>  - remove exist patch in linux-next
>  - dicide multicolor channel by color definitiion
>
> changelogs between v11 & v12
>  - Fix print size_t by %zu
>  - Fix dt-binding name regular experssion
>
> changelogs between v12 & v13
>  - Fix kbuild test rebot build error
>
> changelogs between v13 & v14
>  - Move driver to flash folder
>  - Remove LED FUNCTION MOONLIGHT
>  - Keep 80 char per line
>
> changelogs between v14 & v15
>  - Add ack in commit message
>

Dear Reviewers,

Please let me know if any concern.

Thanks.
