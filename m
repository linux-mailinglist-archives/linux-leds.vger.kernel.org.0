Return-Path: <linux-leds+bounces-4030-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0DA3DE0D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 671DE3A58BC
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4191FC7F1;
	Thu, 20 Feb 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sy78YhVu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB7C1CCEF0;
	Thu, 20 Feb 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064527; cv=none; b=E7DC9Ya/F7JY5YFwS6VNw1+ALJudBNEDie9hw4eOouR7iEdhM/+u8UlcwkPJlCyyrkrmvNk5JxRmwEMKTLOHAdN+SrlIZVSsprVORgof0kuDIBmeeLO0viKNHKB89xN2Dtil1JrkqdoyGOkrVGfFjEd3m3oc/jLC3vTvBQv1VIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064527; c=relaxed/simple;
	bh=qWM1GGPtEOiW6So4uPR6It2p1CxUdVQ0hGwq4FBajeU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=W9+hiH8cwTT7QSH/2p7VvpL43zNvM60s8XxphpNI4b4jAoKatphpDnW32R8lq1N0ZN4/FGvJ5z35JLyNBBCTiHyJ1IB7macTwADlxz8yQnzPk22dzYjvO6YG0lpVlXCIvaB3ooQFJnGvd7J0FBBBqV0gHqjWNu9GYuZ64XvMJP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sy78YhVu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBA1C4CEE2;
	Thu, 20 Feb 2025 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740064526;
	bh=qWM1GGPtEOiW6So4uPR6It2p1CxUdVQ0hGwq4FBajeU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Sy78YhVuxmbD6t4LQvXXQidoScykJlIiv4DiN7IWhsqWxYdqpzNvrwQIwnDl7Y+PN
	 EZ7zWgas+FRS1M0GhPA1zaSlsu52EXmokSVrLR7rod/btjMy2NZ+8HHwM9RHt7tbpb
	 XkDUpZSUWd/MY/DEH8zenZDLkwyRpeqcehQ/c3X0qJUX/S+3B32WHBi9Mo1leUhina
	 AOXGw4Rn2XNCS/fVfjR1lMnRQ48pp3X93+wJuxSFlgadcOh/gdoFx6t2jNwgkAHUf3
	 vgROhCkLTTxiaGswrURWfUEV+9Nft9NeZlPDJzmAZvw/Yke+RdKQaHsWp9mXC8f1bY
	 irdvFcaYMcw1A==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20250213-pm8937-pwm-v2-1-49ea59801a33@mainlining.org>
References: <20250213-pm8937-pwm-v2-0-49ea59801a33@mainlining.org>
 <20250213-pm8937-pwm-v2-1-49ea59801a33@mainlining.org>
Subject: Re: (subset) [PATCH v2 1/3] dt-bindings: leds: qcom-lpg: Document
 PM8937 PWM compatible
Message-Id: <174006452450.805794.4915046882246129904.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 15:15:24 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Thu, 13 Feb 2025 20:54:47 +0100, Barnabás Czémán wrote:
> The PM8937 PWM modules are compatible with the PM8916 PWM modules,
> document the PM8937 PWM compatible as fallback for the PM8916 PWM.
> 
> 

Applied, thanks!

[1/3] dt-bindings: leds: qcom-lpg: Document PM8937 PWM compatible
      commit: 9ec336ba05f6786814696deef637ab2b9f6d0f10

--
Lee Jones [李琼斯]


