Return-Path: <linux-leds+bounces-8695-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LG1tHKQQOWrwmAcAu9opvQ
	(envelope-from <linux-leds+bounces-8695-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 12:38:28 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4106AEC22
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 12:38:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8695-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8695-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C6B53001CDD
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jun 2026 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550D6367B6F;
	Mon, 22 Jun 2026 10:38:22 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD523655DD
	for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2026 10:38:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782124702; cv=none; b=fO8P36+dQ/ZVjSE77bfrtfTpYntTHhNkwdXx6LjHjCaZkCrNF2+DR3ZzCgMg1X4d+wIiLHOQfunVSS6zzjU34WjdQvyRDcfCSZ2TCPb2/uM+7XhQGY1ZZZrTP8PmHveoEgm3h0qlKFOUB1pCRmS1IfKu0kd4WtVrJm/Zy5Jp8Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782124702; c=relaxed/simple;
	bh=CTQXMUV+/UBVnNjzgtkJO88wjy6FOPIwK3y5DrpmBBk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fnMAuFJ1xXgujLklPyi3RF1HIrh6t1EZtM+2pkHGuZNeJMIoBOA1iJdcbTbF24Dp5sKL028xVkhukn/ZayZ/uGyxYFUocUUiS8UUd+pRZf1CvnWUZpeDdww4mz7tDRPMpytgysu7SVUrysZKWwFDqB3B/sc0iTihJmBcCUkT5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.179
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845385adf4cso1860134b3a.0
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2026 03:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124700; x=1782729500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sEwup8vrGtzg0eQ+zIA6Kd2oTy+XBY9jxS2BNcFzC0=;
        b=PF06cv222tByykDKZm5X5CBndcZvusv1g4mvspaqYMW00CvxQ3/Ygzjx1BWj7oWToB
         wwQeMYIHJawCRHPOx5iRiBVuii2AyfFqagzRTdFOt0nIxy45TkDE7pUsXan0CoL74K/H
         sH1SmEVIoGUzCbj3Qjp7PtN4DTvIs4K6VhLQX/EN1RMJPe8/bNl7IjCS313JkbY1kJbB
         PeDCk8t6xWyLHcPn9kKRq5O4ZyJgHZfBKoNUuyK7oC62C18BtfoPEx3SsO7HSA6neMD/
         zN0x1DVw3RgNg/Kbm+wptiZZ9oCXk6UX6fytoSphUHuv7FeDFQBuZGYSojN9p8oF8E3X
         ITcw==
X-Forwarded-Encrypted: i=1; AFNElJ9yzphhvnZ974lAG+f+GtkbTEB3u0d+Taq+hFCOLifkwFboJ2f/0aPq8IFVcyjJybWp275IsW9lsjG8@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEhdtVNbdlMHQvK5kH/WN8+OqG5WCdOOFrSDreiVIxMvB5TrV
	WT2DiUlzdoTx6oPsGzEYV1WPPZVeu6CtIfGMoSUagzS6uekVO3sDG77/nAx3WIha
X-Gm-Gg: AfdE7clSr1FQKVFRoSL1aDGZsrDmXrvTHlseIEQXaL3G4jGU+uE4TC1JHGR2pbbbIeT
	tKoAplAE9imdDYrf9lddRt8rM9T6srJGGM6grU0A5M/YErS+nbAkroDYEeSpR0sFqZ88rA7rahx
	I6C+TRD/n5gsdeVXTx1X94fcEp65QBRLvkQy4pLrG+QhEu+n07klpTFmnwjoBr50EqiQ1/wuME/
	/wo02MYvH7siM2MKcSH3RnyU0e5uvLY2sbo3QPkhhFkPix5KCozqeS9tDI/6Y1rd5qtoKZmpwGs
	bzJ4uENI20fgFkDmIYKb05Y8BHNZygS/3aoGR8P5CIGogHpQ5mDVYkJ1c2uEpUUFIpK1cmnHREo
	WFh7XkNmTgqUwcu2Q5aMgMeHNxiUjPIiHtmZKBlPOqMEemFUcxSsCffegowVS6m4aDu0s8QggBR
	m2uxJut91HVlpy46pnJxRwxHzw7PPyOXD7K1rkwWP0moAh8trt3R80
X-Received: by 2002:a05:6a00:1916:b0:842:670d:f6ff with SMTP id d2e1a72fcca58-84550a07cb1mr14306357b3a.44.1782124700203;
        Mon, 22 Jun 2026 03:38:20 -0700 (PDT)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6adbfsm7605550b3a.9.2026.06.22.03.38.19
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:38:19 -0700 (PDT)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b9e755555so9405663eec.1
        for <linux-leds@vger.kernel.org>; Mon, 22 Jun 2026 03:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RraqUV/TwzWO+xq6HfYU7pbcIRkRhE6raemX5BQP0RctB+v9kT0ObmTjC4KiR1539jUBRtxV70dnyIG@vger.kernel.org
X-Received: by 2002:a05:6102:3314:b0:6ef:f6cf:1b32 with SMTP id
 ada2fe7eead31-72a043c9af3mr8022945137.27.1782124344043; Mon, 22 Jun 2026
 03:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622101606.485961-3-krzysztof.kozlowski@oss.qualcomm.com> <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260622101606.485961-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:32:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWw4+-YZRx2icp_t3OQt3cb9osjac7gziiyRZcHa3zMbQ@mail.gmail.com>
X-Gm-Features: AVVi8CeRh5uGKoGdWXUVe0e4sYYTgs7H91cw7cP665l5Rz_E8v79r8eSiiAY4SE
Message-ID: <CAMuHMdWw4+-YZRx2icp_t3OQt3cb9osjac7gziiyRZcHa3zMbQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: Drop incorrect usage of double '::'
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Georgi Djakov <djakov@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Javier Martinez Canillas <javier@dowhile0.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Jonathan Marek <jonathan@marek.ca>, 
	Taniya Das <quic_tdas@quicinc.com>, Robert Marko <robimarko@gmail.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Adam Skladowski <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>, 
	Barnabas Czeman <barnabas.czeman@mainlining.org>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, Anusha Rao <quic_anusha@quicinc.com>, 
	Luo Jie <quic_luoj@quicinc.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Chanho Park <chanho61.park@samsung.com>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
	Shin Son <shin.son@samsung.com>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alina Yu <alina_yu@richtek.com>, 
	Andy Gross <agross@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8695-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,samsung.com,baylibre.com,redhat.com,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,lysator.liu.se,glider.be,dowhile0.org,linuxfoundation.org,intel.com,arm.com,marek.ca,quicinc.com,gerhold.net,protonmail.com,mainlining.org,richtek.com,ragnatech.se,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:s.nawrocki@samsung.com,m:cw00.choi@samsung.com,m:semen.protsenko@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:andi.shyti@kernel.org,m:djakov@kernel.org,m:lee@kernel.org,m:pavel@kernel.org,m:hverkuil@kernel.org,m:mchehab@kernel.org,m:ulfh@kernel.org,m:peda@lysator.liu.se,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linusw@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sr
 e@kernel.org,m:javier@dowhile0.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:srini@kernel.org,m:bzolnier@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:jonathan@marek.ca,m:quic_tdas@quicinc.com,m:robimarko@gmail.com,m:ansuelsmth@gmail.com,m:stephan@gerhold.net,m:a_skl39@protonmail.com,m:sireeshkodali@protonmail.com,m:barnabas.czeman@mainlining.org,m:quic_imrashai@quicinc.com,m:quic_srichara@quicinc.com,m:quic_anusha@quicinc.com,m:quic_luoj@quicinc.com,m:tomasz.figa@gmail.com,m:chanho61.park@samsung.com,m:sunyeal.hong@samsung.com,m:shin.son@samsung.com,m:quic_mkrishn@quicinc.com,m:jacek.anaszewski@gmail.com,m:jh80.chung@samsung.com,m:m.szyprowski@samsung.com,m:alina_yu@richtek.com,m:agross@kernel.org,m:niklas.soderlund@ragnatech.se,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.i
 nfradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-i2c@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-usb@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-leds@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[96];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,yaml.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D4106AEC22

On Mon, 22 Jun 2026 at 12:16, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> There is no use of double colon '::' in YAML. OTOH, the literal style
> block, e.g. using '|' treats all characters as content [1] therefore
> single use of ':' in descriptions is perfectly fine, whenever '|' is
> used.
>
> Cleanup existing code, so the confusing style won't be re-used in new
> contributions.
>
> Link: https://yaml.org/spec/1.2.2/#literal-style [1]
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Intention for this patch is to go via Rob's tree.

>  .../bindings/power/renesas,rcar-sysc.yaml     |  2 +-
>  .../bindings/soc/renesas/renesas-soc.yaml     |  4 ++--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

