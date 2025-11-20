Return-Path: <linux-leds+bounces-6249-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C425C73F36
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 13:22:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D19454E7875
	for <lists+linux-leds@lfdr.de>; Thu, 20 Nov 2025 12:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A799327219;
	Thu, 20 Nov 2025 12:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIIOsDua"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3BA30C62F;
	Thu, 20 Nov 2025 12:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641234; cv=none; b=gZn74p1Tsz95GhlrpXY8roFV1SQeQQhgmlFMd80EKAb/Q+Y4R8gPN4IirFwgMv5tIxP5CoHYnSZgMBV4zd7Rd6MqVac9FD3Gtw0a9BFHfqfHi3S8c8HgZCFClk8tqx6CBr1TGzjiWvW5A55Aq4vTCoIa17YjgO40BaFamldnyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641234; c=relaxed/simple;
	bh=ke8gjuZusTrJYO19oEdk7CEewMM281yqKdgHeoNfrFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZQ1Q3nfpsTh9Ya3Zu04g3eEOaGtmqQn2RE/k0/peJY4ZfS1GhmhSxbHOqaZh8UF3nYz1Lesd10EBtMtiOm/A3Svyw8RFHehepGH9ZOgepLZuuZzbTYlZHxhTgLpWP7+Faex5XcfAdVXHIbhHwQ0WySesCbOR10ZCVQ9O3MGgnFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIIOsDua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C26AC4CEF1;
	Thu, 20 Nov 2025 12:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763641232;
	bh=ke8gjuZusTrJYO19oEdk7CEewMM281yqKdgHeoNfrFc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CIIOsDuarnqPTot72oF4zqBm7cFf6391E6rH7ytTfoD7oiMzNi0T2dDm0UU5Dmeqx
	 DpuCuX1AUbUfJc+9NEy5H0xfk+31xLeY6cV+fa8MtDmDB0kElqy7a5fKu5HFll3nME
	 yf7ezq1PUDvmWSyJXCY8SptNhS+zb2l2WCjDoK6/YxHDBqNz0dW17//51gMuYdv4tX
	 /DrnieR4W08/6hS4aT0hgv8/2cR/eJnUwLqEIeYZvUiYg50p1W/tcxkedhIU20eHnR
	 +AnfNXuNGnkTwJnQreCRB2YSmEHW6iM1nuT63K0Dn+XIVAGSChctbrXABW+y0I/R0P
	 ak3sB/mfN3POQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: liqind@163.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
Subject: Re: [PATCH V10 1/3] dt-bindings: leds: pwm: Add enable-gpios
 property
Message-Id: <176364123028.661829.1279847907031507316.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 12:20:30 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Mon, 17 Nov 2025 05:45:08 +0000, LI Qingwu wrote:
> Some PWM LED driver chips like TPS92380 and LT3743 require a separate
> enable signal in addition to PWM control. Add this property to allow
> device trees to specify such GPIO, which will be controlled
> automatically by the driver based on the LED brightness state.
> 
> 

Applied, thanks!

[1/3] dt-bindings: leds: pwm: Add enable-gpios property
      commit: d7dca03a48e2e95b4469d3e3a1ef23065d90f98b
[2/3] leds: pwm: Add optional GPIO enable pin support
      commit: bb64206276db15f1d6e115febb262c9830628625
[3/3] leds: pwm: Reorder include files to alphabetic order
      commit: c7a2e5eed13b8eec5e1d38fa15d2108cc5f8c730

--
Lee Jones [李琼斯]


