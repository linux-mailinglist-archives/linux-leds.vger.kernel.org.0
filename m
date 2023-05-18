Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45E3670838C
	for <lists+linux-leds@lfdr.de>; Thu, 18 May 2023 16:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjEROG1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 May 2023 10:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjEROG1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 18 May 2023 10:06:27 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4488910D9
        for <linux-leds@vger.kernel.org>; Thu, 18 May 2023 07:06:25 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3078aa0b152so1390520f8f.3
        for <linux-leds@vger.kernel.org>; Thu, 18 May 2023 07:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684418784; x=1687010784;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azqpCVnd/614+AfKRHDl6hN6ez5a51IoobwFr9W5qBQ=;
        b=h+GRLvpVsV6qF+yhQyC+9b89tOnb+IO73WPsf/PENnlj/jBn9IHDnS3KG2cpxTAoSi
         ix13lFUJ/6yah6rp5/iuHqJzworFHDCDRWlmVTJfPoIyi/b8ZQWsq7QGGwXxS3MgKR5b
         lxVSwmnxQIbRUscKxLYp1u/pdm+ggnBOTSW6oFHFM6nnLsAoAL8a3GI8E3kjQK+xlHIo
         eNomgcLsFD3Byhthgx2JOBp3d81/Qf2/lXHfkszJkGuHG0EovhpGJeXYXJ16T8GiKbaF
         JTwccEgIFv27bd9bxEelXasc/qEmPjALXS/fhVMT625offvc0Gb7VwOivbAqiwudCXRu
         7iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684418784; x=1687010784;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azqpCVnd/614+AfKRHDl6hN6ez5a51IoobwFr9W5qBQ=;
        b=EeEElfNZ/JYBfAOANV8XO5DD3tHe/TAyOtyH3Qm5ib5iw+mMI7hyb/uSEZAssbcnRi
         1pUR4Xy7goRQ7FqUyiA7pPF9mBQC7Qz/4cKA4NLfjKgo6MxvDe4Fg5Kp5CeW2Jdc8Vfe
         Hl0uQ05bUTng6XX5CxO+FML5BkKWfgatLE4TVR4ksq22rd2OWfb1a0lRA+WCORUGM+t4
         gsTcYzJ4Dffe/KcYflh4xUf27PmYXV6KCkIfZkO7uO2BVTD4LSggAMgoL5jXIA1pGd9J
         ZZkpCkWqioMSUPWWYAFE7+2X24TlV14rSEUPfupCC+GDEHSYJE0qRNV00aBOAEyeV2ax
         1fsg==
X-Gm-Message-State: AC+VfDySOb9WnCrGKUKk8jQPC/2lIo4+5PQD9wfqeyUe+sst1c40WKi7
        WQCmjuDbqarlyU261yJ6tCKKOA==
X-Google-Smtp-Source: ACHHUZ7G56jeX+RtKQ3jgdBRAl+/CNsoOO6ryL3IsYzeTnzcHLO0SRpVzbHO+rNNmTHmhy28FkvR+w==
X-Received: by 2002:a05:6000:1245:b0:2ef:b19f:b24c with SMTP id j5-20020a056000124500b002efb19fb24cmr2059445wrx.0.1684418783660;
        Thu, 18 May 2023 07:06:23 -0700 (PDT)
Received: from localhost (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id n16-20020a1c7210000000b003f19b3d89e9sm5389587wmc.33.2023.05.18.07.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 07:06:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 18 May 2023 15:06:22 +0100
Message-Id: <CSPGMHY9BH1S.J16A0P4WUJ9V@lion>
Cc:     <linux-arm-msm@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <amartinz@shiftphones.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sdm845-shift-axolotl: enable
 flash LEDs
From:   "Caleb Connolly" <caleb.connolly@linaro.org>
To:     "Dylan Van Assche" <me@dylanvanassche.be>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <pavel@ucw.cz>,
        <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <quic_fenglinw@quicinc.com>
X-Mailer: aerc 0.15.1
References: <20230518133113.273880-1-me@dylanvanassche.be>
 <20230518133113.273880-4-me@dylanvanassche.be>
In-Reply-To: <20230518133113.273880-4-me@dylanvanassche.be>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu May 18, 2023 at 2:31 PM BST, Dylan Van Assche wrote:
> The SHIFT6mq (axolotl) is an SDM845-based smartphone with 2 flash LEDs.
> One LED is white, the other one is yellow. Define both LEDs in the DTS
> so they can be used as flash or torch and enable the flash LED
> controller to control them in PMI8998.
>
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>

// Caleb (they/them)

> ---
>  .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm=
64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 0ad891348e0c..1eaff964b202 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -554,6 +554,28 @@ led@5 {
>  	};
>  };
> =20
> +&pmi8998_flash {
> +	status =3D "okay";
> +
> +	led-0 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_WHITE>;
> +		led-sources =3D <1>;
> +		led-max-microamp =3D <100000>;
> +		flash-max-microamp =3D <1100000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +
> +	led-1 {
> +		function =3D LED_FUNCTION_FLASH;
> +		color =3D <LED_COLOR_ID_YELLOW>;
> +		led-sources =3D <2>;
> +		led-max-microamp =3D <100000>;
> +		flash-max-microamp =3D <1100000>;
> +		flash-max-timeout-us =3D <1280000>;
> +	};
> +};
> +
>  &qup_uart9_rx {
>  	drive-strength =3D <2>;
>  	bias-pull-up;

