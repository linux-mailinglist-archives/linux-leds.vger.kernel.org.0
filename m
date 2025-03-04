Return-Path: <linux-leds+bounces-4145-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29954A4D6CD
	for <lists+linux-leds@lfdr.de>; Tue,  4 Mar 2025 09:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00C95188E28A
	for <lists+linux-leds@lfdr.de>; Tue,  4 Mar 2025 08:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0691FC7DF;
	Tue,  4 Mar 2025 08:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mETPgI23"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E791FCF68
	for <linux-leds@vger.kernel.org>; Tue,  4 Mar 2025 08:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741077705; cv=none; b=qZyq9YEwG3AXbRfLHX/SNNDYrIcCoR5jzFKHE3s32Q0w7uHHuxhiH41MzMBT9pu1jCsac0ZLX3wEYMPh2t17us2QJLbkGec3TXKvO+qju0btKAwMAT+xg2JxAsEDZ89V+mTM5Aiz0JqHq8jlxqlJ/XgAn5zPCxqH9VacVRWWDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741077705; c=relaxed/simple;
	bh=dQMWqa7bqGUsuYvK1/Ia2Th2yYYxZTfZ4zTTgbD3dM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXaqOhTd2LGr77k0i6inUUL2wtd64yk1WGxIvvbwiPt9p/iMBJyMjnwoZhVFgT+QmbGijdnJt4UxLsLoSnlklLWTDoaHoutjTQtGrQsRux4EFGsUkFp0YCHlBPdajyzXBrSel4qLjxotblY+862Pf7d7V6U6LeOTmS113z/EwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mETPgI23; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac202264f9cso983866b.0
        for <linux-leds@vger.kernel.org>; Tue, 04 Mar 2025 00:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741077701; x=1741682501; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56LRZhimeVf0548v2DjrELpnYIUuGBcJG2m3Hu8yBtw=;
        b=mETPgI23iMZxrX7GFlSZRwwi7jXMWbtYR4M3vRphfBCECl58WfB81Rx9vB6ka0K3t2
         L/LFUswCMPP7zQsX2+qYYyvXJlIFe0+96ZuZB8QIMW20xuVvEn+22VTPPwE1ykFp8UET
         QugvwKbKib9yg5nXJnasC8WWRhvPtotg0o5LLcT2L7QDr4n/HgpZlFourgonBQLEcyHz
         41qc2oNbkw5hA/ZW/Afs2EeB6X3vq1X7y8SunsRQFmSsV8LSHWEd8ogu72H0yiamGsVk
         8v6oVEFyYisedodPQ4g7etioVcdXT7oFxC3SNWy+UxjDNYvR6ytzHziVV9qqpUhDN4/i
         ShJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077701; x=1741682501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56LRZhimeVf0548v2DjrELpnYIUuGBcJG2m3Hu8yBtw=;
        b=FiJJA0AcUnlKFBiutbbgIXB1JUb2JTZK35GZsCf6NFVQK3MR3r60DN4EQvrnRppKuo
         T3xgx7VMGnuNYZzDOzhCMLlqt5mlodrfixlA48+/HNV++QZMnRxIaQa0hGi3RW330WUI
         hbxxn/7RqH5O9OyzddDosqA55mGxsFzYTAz2OGY7JPVgc62Qh5foKfDVzHxe9XgNgA1x
         BPiQZLYZeIPi/P75kgBg8v6dNYI+te7aEa3cBPgLbqK427/HM3UDUBt+AIHgjRUjP88O
         SxbkZu86wseSKXPT/TFwMKu/RhLKT28AqwFhtvaHXcESRCGsVzbbGNrm692ZKRg9VJPc
         541w==
X-Forwarded-Encrypted: i=1; AJvYcCXs7/pdhg5QdIVOooq/lI9BkvlKj8cGqAkBbIlinLA9df4hN1u+2AlVFPdnRgE9lJNycSowCgd9O7m1@vger.kernel.org
X-Gm-Message-State: AOJu0YzNLWKEwj0SwJreWpdKj691zRDka9AejDd13GLdxEnt+rwhrFpW
	+Q7SecW67RTO8LVqGYeiwxcsNFz+l9mTV0Mb6qkYTUfJagU62Kz26KpJwYo+kwQ=
X-Gm-Gg: ASbGncs9dyJDck6OOAlIe3w5woNdpBer5oYcJo2YBXOREyHmlEfJCdeGnXjO+MtNufk
	ITrVVgWUsEvB7pfM3OYHlRJzsSrdOMVkmP/GVqxC98RUfeqDIL8mx+NFtrxlMNZuo/hjWzQS8Z9
	LP+RuGISpqwhdm/piC89ymwSnjiElAhAuKIYXwN88w2awf0yckr7K2g9t+Qmksv52vACVjxKecD
	gUQpL4DOduKGisGaNuEaCTsqQOCptNzNPu89Xh2xEjcc1HE33+X+Dg6K2ME9GxS6a6Rbuda7t6v
	KhFmVBc3+qNCwTppK6cnfhvN8NM72saqhRRNuOepPA==
X-Google-Smtp-Source: AGHT+IFFHM/nljeEtmfpwAYQ5fCe3mzYlZ/kbhPchbUbj2wuqBNp/7U42a+daD7qurHBY27yA6v3Yg==
X-Received: by 2002:a17:907:7d89:b0:abf:7832:bf5 with SMTP id a640c23a62f3a-abf783244f6mr732543466b.34.1741077700633;
        Tue, 04 Mar 2025 00:41:40 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf529feacfsm557445466b.153.2025.03.04.00.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 00:41:40 -0800 (PST)
Date: Tue, 4 Mar 2025 10:41:38 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Kamal Wadhwa <quic_kamalw@quicinc.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] leds: rgb: leds-qcom-lpg: PWM fixes
Message-ID: <Z8a8wrEcBuZrGm2/@linaro.org>
References: <20250303-leds-qcom-lpg-fix-max-pwm-on-hi-res-v3-0-62703c0ab76a@linaro.org>
 <lvi75asit3ati7wwnyae6rowycr3veodswu7blbnzbrq646fgi@iksn4qas3dwt>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lvi75asit3ati7wwnyae6rowycr3veodswu7blbnzbrq646fgi@iksn4qas3dwt>

On 25-03-04 07:29:46, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Mar 03, 2025 at 01:52:49PM +0200, Abel Vesa wrote:
> > The PWM allow configuring the PWM resolution from 8 bits PWM
> > values up to 15 bits values, for the Hi-Res PWMs, and then either
> > 6-bit or 9-bit for the normal PWMs. The current implementation loops
> > through all possible resolutions (PWM sizes), for the PWM subtype, on top
> > of the already existing process of determining the prediv, exponent and
> > refclk.
> > 
> > The first and second issues are related to capping the computed PWM
> > value.
> 
> I just took a very quick look. I'd say squash the first and second patch
> into a single one. Splitting a change that fixes the same issue in the
> two branches of an if condition has no benefit.

Actually, the first two patches fix different commits.
The first patch fixes a commit that is only in linux-next for now,
while the second patch fixes a commit that has been merged in 6.4.

So they need to be separate patches.

> 
> Other than that this patch set would also benefit from what I wrote in
> the review of the other patch you send: Please mention a request where
> the result becomes wrong. This considerably simplifies understanding
> your changes.

Sure. Will describe the 5ms vs 4.26ms period scenario. Hope that's OK.

> 
> Thanks
> Uwe

Thanks for reviewing,
Abel

