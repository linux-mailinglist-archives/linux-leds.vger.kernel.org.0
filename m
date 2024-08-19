Return-Path: <linux-leds+bounces-2484-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D65195702E
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2024 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FBA21C22F39
	for <lists+linux-leds@lfdr.de>; Mon, 19 Aug 2024 16:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB6216D307;
	Mon, 19 Aug 2024 16:25:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677B171E5A;
	Mon, 19 Aug 2024 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724084755; cv=none; b=iV9vYePGU/zEVADYyR2HariTleI5oNtkjlxx8SAYZTelJfgWVeJJFa4zVoSq45cWQSWpUbAeD2LWcqC1ec+EIAxy+3tBMGb2OOjh87mCcYZWGhnS0xZimMeqzZaDl4cR5JBaRo0BRHByDOGLNffgwBYsld7RMDncOGNUghHJnqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724084755; c=relaxed/simple;
	bh=7NqWr36HuVT4OotxGSUjFuV5V7CFfE5R2Y8n4XuSnJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWbOHUuOaKUb8wpZVfqVp/S0D7WbcvlSElGH8UNAl8D7L3HIYyKFFaLTRDOMfBkGH+gksvbXW1Asu+vp3uHHmViNQZalhAF0EakEMrmBNsIz3iu6ZZ4WxVux8ZkSptvofve2XHlXVlFW6jNLIAIlSVTak/RN7zWpVYuz4Abp9JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5320d8155b4so5993250e87.3;
        Mon, 19 Aug 2024 09:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724084750; x=1724689550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tHGsPt2XMV+DbbdXwYM1UeT8GX8eWUBRSysGoQM7AE=;
        b=bNJq+Rw785w2jTdYl94ryOYR/RVv+hyZt9J489GwYhx8XUkGgfboty6vbsdjrw5xfb
         c0HWbZUnc2nKh16uTv4Rtm1pWaQQnRTDihHmuyxbPRprZA11BkYMg8mOqKUG2KgRUbqX
         N4A+WSRCDIZBy8Vnheqf1YE6hTaUTJT0s9DR0s2BdRJNw7BGk/gGwp28rbwCKZFx68S/
         wnGXeYA0HWkl+ClsvIDD4r5Qp6sGVjHiEGUzJw2GErz9CmriVAEmF9IaJ2A/PQ4LIjSr
         Cd4acVMfZWOLthrOxdgjkCHL+2DofKXAzxYeQp7XdYuN1dwvAzsbLZp+DYYLDVhj3pE+
         eR7w==
X-Forwarded-Encrypted: i=1; AJvYcCX1LL9OVKLo7i8hCXjf8F9a3aRnRhjp0eB/d9zC+I21Gdk4Ycn9AyLUmTA3SVbQ1H9Mi8r0KhEf+IJBgZRn9nMvmSJTGu7xE1bF+lyPPmF+akTZG7wltEUYMhvFj1PRhyw0SC26Tzz2Tw==
X-Gm-Message-State: AOJu0YwHvSaBIaH1rKM/JS9CaE+KE7XEwjvlZl0FyYv8Up9qPbXNFaoj
	MxjgmnlaY4Sl20bqtbsRNcakm5yYLrcKnwdciKtq2UppG6R1fZeWpLmEutT2
X-Google-Smtp-Source: AGHT+IGwo3bgpgel4eWIt6KQmb8XiyzPCXu7fJeaFolaMY9n4nV7Nq04DXfOFAA0+/S+u2Y2gkI/Tg==
X-Received: by 2002:a05:6512:ba3:b0:530:e323:b1d0 with SMTP id 2adb3069b0e04-5331c68fccfmr7474305e87.9.1724084748771;
        Mon, 19 Aug 2024 09:25:48 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d3b8ee7sm1527455e87.115.2024.08.19.09.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 09:25:47 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so46174421fa.2;
        Mon, 19 Aug 2024 09:25:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyx9NWTFyHqI5wye86Cg3I/jCAYnkXztTwxTMKsmsjyCV9GB7SkcKiZSIS2QE1uo5fobGCwuw7IVMbvsKA5ctR8lcYsH3C2i++VTKBawPSPUBtgZcTp//Bzm87KVw6aGEFqXOTBfcIYA==
X-Received: by 2002:a05:651c:504:b0:2f1:56a6:6057 with SMTP id
 38308e7fff4ca-2f3be57849emr72731681fa.7.1724084747357; Mon, 19 Aug 2024
 09:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240816171129.6411-1-abhishektamboli9@gmail.com>
In-Reply-To: <20240816171129.6411-1-abhishektamboli9@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 20 Aug 2024 00:25:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v66J7ceyPikD8atnybMD-UsVwAJZ4TRo16LroyVkAOc1Yw@mail.gmail.com>
Message-ID: <CAGb2v66J7ceyPikD8atnybMD-UsVwAJZ4TRo16LroyVkAOc1Yw@mail.gmail.com>
Subject: Re: [PATCH] leds: sun50i-a100: Replace msleep() with usleep_range()
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: pavel@ucw.cz, lee@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, linux-leds@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	skhan@linuxfoundation.org, rbmarliere@gmail.com, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 17, 2024 at 1:12=E2=80=AFAM Abhishek Tamboli
<abhishektamboli9@gmail.com> wrote:
>
> Replace msleep() with usleep_range() in sun50i_a100_ledc_suspend()
> to address the checkpatch.pl warning. msleep() for such short delay
> can lead to inaccurate sleep times. Switch to usleep_range()
> provide more precise delay.
>
> Fix the following warning from checkpatch.pl:
>
> WARNING: msleep < 20ms can sleep for up to 20ms;
> see Documentation/timers/timers-howto.rst
> +               msleep(1);
>
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

