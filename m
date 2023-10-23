Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 614E47D2B20
	for <lists+linux-leds@lfdr.de>; Mon, 23 Oct 2023 09:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjJWHVY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Oct 2023 03:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbjJWHVW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Oct 2023 03:21:22 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FFE1D7A
        for <linux-leds@vger.kernel.org>; Mon, 23 Oct 2023 00:21:19 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-540105dea92so2169974a12.2
        for <linux-leds@vger.kernel.org>; Mon, 23 Oct 2023 00:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698045678; x=1698650478; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXFEIIjXJDnknqYDecq1Ocr2lT28f1gIUh/Ja5PDVhY=;
        b=Dm2RcdW3HJJTS8XNSsuRt8EjrCMxPlOMn1KGe6ePNgVOvwgqw6WwAPv2w/CBT0Jt3l
         t9iJpjbMftIA2EWTgRpkpisevKtUJZ/1aaHfTM6rg3/7GRJOhBtkXlhPzVTUBqizcTiR
         xf3ZJVtg14yuhYsrIZmxiQkIdpPuba4fU66EeXaOXjgtD3824p5wVo1ZcTOheewtSsHR
         JQUPlJV2g1r+3Xfw2riWU76W8sjb0L/y5Bv0cWu0vdTehrIvS8GIklPFSYJgHiaEsB2H
         N1bsZmv2doi/Omv62Ii91rwE+AgW0XCDrmMfR8GxekV43I88czzczWCIOHWllKtyk5mM
         meIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698045678; x=1698650478;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXFEIIjXJDnknqYDecq1Ocr2lT28f1gIUh/Ja5PDVhY=;
        b=StTGSNPLYdHCBd2f7kjNxoz+GNrDztxZvn3bhuGBHjUtkW3V8XFXpQtdb44+Jun4KE
         0IYo5o7C6kibkkCJ8fCaMQxmzhOHUlcZXpuqkNGLvhUr04UzfYd3DcZhNMP0Gn4p3EUU
         J8OUa1VeK9StbMldcnthzeEZBnPHaTHCFJPv8DJiV7B0gESCKXviU9RdzxrntMDRYLfj
         JjVZthFFNxqbOpTbuZW0QfQ7yV2D9jpr7DSPHkIg69VBRjZMPhGT7mQyJeL31ezb7tIU
         py+auI9ozT5TfQtGxo050JuZH+TAEZxH8M+7dLoC0NLldPMsQeebmI1SQ8Ne4cfsWfwm
         ZOsA==
X-Gm-Message-State: AOJu0Yxr/NLLHUmOil2sSc0bMvFIYXrdbKkjufTBAKgMV/LJKAgeWnGC
        bqCZ5hs5kbPMJaSvjCAISXNtqRCXC4bmptoETE4YJQ==
X-Google-Smtp-Source: AGHT+IFqe/CmfqfzzIPPiPtZyuMLgmVsNA7lgokJECBM3fv3IMpRzoeLdxIXslrX9gPjd48rEIC4Cw==
X-Received: by 2002:a05:6402:350b:b0:53e:782f:cfa6 with SMTP id b11-20020a056402350b00b0053e782fcfa6mr5958551edd.37.1698045677996;
        Mon, 23 Oct 2023 00:21:17 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m9-20020aa7d349000000b0053dff5568acsm5829153edr.58.2023.10.23.00.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 00:21:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 23 Oct 2023 09:21:17 +0200
Message-Id: <CWFMYF24IN3Z.17JCGT64AHQW5@fairphone.com>
Cc:     <konrad.dybcio@linaro.org>, <u.kleine-koenig@pengutronix.de>,
        <quic_subbaram@quicinc.com>, <quic_gurus@quicinc.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v6 5/7] leds: rgb: leds-qcom-lpg: Update PMI632 lpg_data
 to support PPG
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Anjelique Melendez" <quic_amelende@quicinc.com>, <pavel@ucw.cz>,
        <lee@kernel.org>, <thierry.reding@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <andersson@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231020182218.22217-1-quic_amelende@quicinc.com>
 <20231020182218.22217-6-quic_amelende@quicinc.com>
In-Reply-To: <20231020182218.22217-6-quic_amelende@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri Oct 20, 2023 at 8:22 PM CEST, Anjelique Melendez wrote:
> Update the pmi632 lpg_data struct so that pmi632 devices use PPG
> for LUT pattern.

Hi Anjelique,

The hw_pattern now works as expected on PMI632, with the commands
written in [0]! Thanks!

Tested-by: Luca Weiss <luca.weiss@fairphone.com>

[0] https://lore.kernel.org/linux-arm-msm/CVX5ZUGU9BVE.2TA819U1AI6BZ@otso/

>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> Reviewed-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/leds/rgb/leds-qcom-lpg.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qco=
m-lpg.c
> index 0c6d0e593c06..92fee512d965 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1640,11 +1640,13 @@ static const struct lpg_data pm8994_lpg_data =3D =
{
>  static const struct lpg_data pmi632_lpg_data =3D {
>  	.triled_base =3D 0xd000,
> =20
> +	.lut_size =3D 64,
> +
>  	.num_channels =3D 5,
>  	.channels =3D (const struct lpg_channel_data[]) {
> -		{ .base =3D 0xb300, .triled_mask =3D BIT(7) },
> -		{ .base =3D 0xb400, .triled_mask =3D BIT(6) },
> -		{ .base =3D 0xb500, .triled_mask =3D BIT(5) },
> +		{ .base =3D 0xb300, .triled_mask =3D BIT(7), .sdam_offset =3D 0x48 },
> +		{ .base =3D 0xb400, .triled_mask =3D BIT(6), .sdam_offset =3D 0x56 },
> +		{ .base =3D 0xb500, .triled_mask =3D BIT(5), .sdam_offset =3D 0x64 },
>  		{ .base =3D 0xb600 },
>  		{ .base =3D 0xb700 },
>  	},

