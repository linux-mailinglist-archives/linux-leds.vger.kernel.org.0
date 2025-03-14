Return-Path: <linux-leds+bounces-4286-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE41A61B59
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 21:02:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C86881E62
	for <lists+linux-leds@lfdr.de>; Fri, 14 Mar 2025 20:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F8C205E14;
	Fri, 14 Mar 2025 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXZZuGAV"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97382205E0D;
	Fri, 14 Mar 2025 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741982489; cv=none; b=USleHlwrV3BbUHGeW5zVzU30tJa3F5jjEJ7Xi3ca8o/JdtHzhzNUi7ZAObRn/VzLzA4wVt4SEa0NMpmHizSeWVxcxNVXh9PVzIe0Dom8lgV64H1yy3Ps66kuoDT6RdLnsPr+2alwrlvEkiT4gnzQACYbjAJBjmWsKk5DlpI1vvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741982489; c=relaxed/simple;
	bh=uI7supORXJIUgf0wIYyGk/4SAOuPMkmRVUwHoI62pPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RtOaHDwz9HIKWhlXpxSvh5fKlosnDvKsRXGOcKKAn+3bBc23ydcFJvbK91SgO7i4nTwhJeOpRaF//QwviD+tqsUa48SbrzAwBmozjx7WVm8VeaHmKmEGDhWsanvAkqGvi2gb+op9R3LOoPch+tDsyEBxzrHGYoJJcC089WgutBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXZZuGAV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE30C4CEEF;
	Fri, 14 Mar 2025 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741982489;
	bh=uI7supORXJIUgf0wIYyGk/4SAOuPMkmRVUwHoI62pPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AXZZuGAV+63TnyvMLKqbBkxR7QFHcIMCKzDxMvheN25H1SvOD3ZkEMlTfe8zt856U
	 5RCmk6f9wcJLyLtQlgyHMdcMoMQ8L5nISx2mUbClI6D8JaDaqnVdfAKG2hbSznpt/P
	 C4PN5z/xsyrbiO6kS4RGqIDF3KysrZ7WbtzPGIpPuYlpZR7bVsQa851HA9F40dHRGO
	 M7Tognac9Tj50+OL7mSpf7BxDIecwkZoPpZfeAseiwn9wOT04qOJ4RFafD+sV7dGl/
	 uWbJRs6OqxpQ+EnzQoEXrFUS+eYUiiADdgqkpxH66O5/LfMN5GKgiwsjd8lpRoXwNX
	 U3eDSumtrhzDg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Daniil Titov <daniilt971@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] Add PM8937 PWM and display backlight for Redmi 5A
Date: Fri, 14 Mar 2025 15:00:45 -0500
Message-ID: <174198247871.1604753.9818860093094603350.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 13 Feb 2025 20:54:46 +0100, Barnabás Czémán wrote:
> This patch series add pwm node for pm8937 and enables
> pwm backlight for Redmi 5A.
> 
> 

Applied, thanks!

[2/3] arm64: dts: qcom: pm8937: Add LPG PWM driver
      commit: b18c1aa6404303888ab924f149135835d223f4e8
[3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add display backlight
      commit: 5b74065e6c2482507435cdf7c4d0aab1830b9676

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

