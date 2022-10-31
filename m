Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29CE661387C
	for <lists+linux-leds@lfdr.de>; Mon, 31 Oct 2022 14:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiJaN4z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 31 Oct 2022 09:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiJaN4z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 31 Oct 2022 09:56:55 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F6410557
        for <linux-leds@vger.kernel.org>; Mon, 31 Oct 2022 06:56:54 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id l11so16367931edb.4
        for <linux-leds@vger.kernel.org>; Mon, 31 Oct 2022 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcCKYUH9Lbw/pHPSk6/2WqMZQyQUMyuhsXpUiDfOF6A=;
        b=MHShAiwKTrTKgezu8b/h1HoWiKmRbMo2Se7Cqp0JBdChjeixK+L0le1H3GXkvigB+s
         tl1nb+Pnb1oJjdpb/LjPiD9TJUKR7TUUPFUHxlwjWN1j2ruklEG3lDaWN19Q5V7o8i2Q
         9ae1VwZkDTRFRsksktZlCLJ7ukCegJxsj2IP1C3+23KdkS872MiAqMHYUaA0Y8tj5X4m
         pZxEweYicWfz1f3HCYMGqWP4u+oouDxlrGb0/RU3S8kFR02V3F6lk405m4PmD4WUR2LO
         CsbLxLDBTKjBBFeQBWhgZz7hrFJuiMpeZOa+wHqM5IfSZLG4v481jSWye7Gm9kURvhmJ
         Gl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZcCKYUH9Lbw/pHPSk6/2WqMZQyQUMyuhsXpUiDfOF6A=;
        b=bfRfhbXd/Q87Yh+JIc8vQldxvDPdFaaA4pY46qxA6YU1Xt0lF406cnhsP3kecQginP
         /hgUD8h/tZX4iEWg4+JojBvwZDQRKqQRZv01PCEHCD+LoHtFtta3wd/N+19DTs5W2leu
         rbrnhLynBzB+bjvWBeQab+csqy2Tj2i1RDM8VSCjQwJ6weUB/Rk0qvCBvpUNor0hSoAt
         qUkySSbB9ZCKkQx7RD0xmgrfJsGx6Q8UQz4kxCPngLH4N0SaAwW7ElS+vdKAn+E8nn7X
         ElOVsqQgEyZhxxlovOm8wbfRWGZSlrOtYSi80hsLHE/rs56Lg2jQDI8he3XVMy7hfvnP
         SCHA==
X-Gm-Message-State: ACrzQf1fEzBo/7j0NZL4rvP6Oor0tB1On17Xmn9e/PXxwiQRJRDv3kyi
        BXaCUAGldNsxUPU90sw+DukrTw==
X-Google-Smtp-Source: AMsMyM6u3JAX6R+7QqE3QY18S43gVSOpaUsIoIZwvU1h8v4fcdHEBIhKdyE7CRGMaOBEy+diJLl18Q==
X-Received: by 2002:a50:ec99:0:b0:462:2c1c:8764 with SMTP id e25-20020a50ec99000000b004622c1c8764mr13656055edr.325.1667224612782;
        Mon, 31 Oct 2022 06:56:52 -0700 (PDT)
Received: from localhost (31-151-115-246.dynamic.upc.nl. [31.151.115.246])
        by smtp.gmail.com with ESMTPSA id t31-20020a056402241f00b00459cd13fd34sm3214246eda.85.2022.10.31.06.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 06:56:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 31 Oct 2022 14:56:50 +0100
Message-Id: <CO05SSJUFW72.1PUZJ0FMJH3DF@otso>
Cc:     <quic_collinsd@quicinc.com>, <quic_subbaram@quicinc.com>,
        "Dylan Van Assche" <me@dylanvanassche.be>
Subject: Re: [PATCH v4 1/2] leds: flash: add driver to support flash LED
 module in QCOM PMICs
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Fenglin Wu" <quic_fenglinw@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <krzysztof.kozlowski@linaro.org>, "Pavel Machek" <pavel@ucw.cz>,
        "Gene Chen" <gene_chen@richtek.com>,
        "Jacek Anaszewski" <jacek.anaszewski@gmail.com>,
        <linux-leds@vger.kernel.org>
X-Mailer: aerc 0.12.0
References: <20221025073802.2662564-1-quic_fenglinw@quicinc.com>
 <20221025073802.2662564-2-quic_fenglinw@quicinc.com>
In-Reply-To: <20221025073802.2662564-2-quic_fenglinw@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Fenglin,

On Tue Oct 25, 2022 at 9:38 AM CEST, Fenglin Wu wrote:
> Add initial driver to support flash LED module found in Qualcomm
> Technologies, Inc. PMICs. The flash module can have 3 or 4 channels
> and each channel can be controlled indepedently and support full scale
> current up to 1.5 A. It also supports connecting two channels together
> to supply one LED component with full scale current up to 2 A. In that
> case, the current will be split on each channel symmetrically and the
> channels will be enabled and disabled at the same time.
>
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com> # sm7225-fairphone-fp4 +=
 pm6150l
> ---
>  drivers/leds/flash/Kconfig           |  15 +
>  drivers/leds/flash/Makefile          |   1 +
>  drivers/leds/flash/leds-qcom-flash.c | 700 +++++++++++++++++++++++++++
>  3 files changed, 716 insertions(+)
>  create mode 100644 drivers/leds/flash/leds-qcom-flash.c
>

<snip>

> +static const struct of_device_id qcom_flash_led_match_table[] =3D {
> +	{ .compatible =3D "qcom,spmi-flash-led" },
> +	{ }
> +};

Dylan has noticed that auto-loading the module based on dt match doesn't
work currently. It seems that this line is missing here to enable that:

  MODULE_DEVICE_TABLE(of, qcom_flash_led_match_table);

Please add it for v5!

Regards
Luca

> +
> +static struct platform_driver qcom_flash_led_driver =3D {
> +	.driver =3D {
> +		.name =3D "leds-qcom-flash",
> +		.of_match_table =3D qcom_flash_led_match_table,
> +	},
> +	.probe =3D qcom_flash_led_probe,
> +	.remove =3D qcom_flash_led_remove,
> +};
> +
> +module_platform_driver(qcom_flash_led_driver);
> +
> +MODULE_DESCRIPTION("QCOM Flash LED driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.25.1

