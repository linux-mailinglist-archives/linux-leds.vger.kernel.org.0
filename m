Return-Path: <linux-leds+bounces-2323-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F593C720
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 18:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B4292833D8
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 16:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A50819DF92;
	Thu, 25 Jul 2024 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yn+C02f/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C89B19DF86;
	Thu, 25 Jul 2024 16:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721924888; cv=none; b=ZTxj+uF5AzZ7wIUoWoo/pmZQup/fRfBlsrQtgoAXzCzeGRK2U8hw5wsIVGsDQ7t+wh62SY1R7xJdH19mlEo8VjyY/oqJFEKi244n/2vIliqt4nFhHUf0mHvWvwxLcpPdVY9wZBwnMN3lMCusYNxXSzr7ezfCXOLd9e4uqKUwZVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721924888; c=relaxed/simple;
	bh=D+1K37f9Eu/3aYFDb/ufjHrcefMCPhYev9u6FW28edw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WaUi4aAb6Vk5I73Q69GhCzVmiBxt3qPmpVccB7YHiQEjS79t6PdtOoktgpcvWNlhTmOqIrdu1HtBMTOQePUoaoIV6RvbYuog618uMltQrT7/W5sEgGSwMC9V4yNJVB0qBkMYQEXWHRQucQbsWNJxhgezB97MuL9FsFCHY0vZAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yn+C02f/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E410C4AF0E;
	Thu, 25 Jul 2024 16:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721924888;
	bh=D+1K37f9Eu/3aYFDb/ufjHrcefMCPhYev9u6FW28edw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yn+C02f/XzXbbUWbenckJ+lzK0Hy8IFarQsnPThtEQNOAj+xiXOVUpBB9RfmEgI51
	 6fOgNuATtZiuEoJVBn+6B6RYb651y/OA/wYdfY1yzjkDfuxxku8vPhCujBV2BhvMI/
	 dfsVS/PP/5bUopCAqhU2J8ObYDaG0Cl7DeSvSLxVM42roukxhksKEB49O9tus64Oku
	 Np9dnLzom/CjP/I6SI/DdGio9tfA5LIA/xgargaIUQsbjHejqNBjji1eJp6aRAZ6Fj
	 iLSv40hdQeRpkGMMBKdAkLLdqqnBAR8LLaXoReCCn3f4B62JwfB6DKxrzrj4PfbsaQ
	 dbCBWjoan/OxQ==
From: Lee Jones <lee@kernel.org>
To: kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Collins <quic_collinsd@quicinc.com>, 
 Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
In-Reply-To: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
References: <20240705-qcom_flash_thermal_derating-v3-1-8e2e2783e3a6@quicinc.com>
Subject: Re: (subset) [PATCH RESEND v3] leds: flash: leds-qcom-flash: limit
 LED current based on thermal condition
Message-Id: <172192488634.1053789.976131312615476659.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 17:28:06 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 05 Jul 2024 15:55:01 +0800, Fenglin Wu wrote:
> The flash module has status bits to indicate different thermal
> conditions which are called as OTSTx. For each OTSTx status,
> there is a recommended total flash current for all channels to
> prevent the flash module entering into higher thermal level.
> For example, the total flash current should be limited to 1000mA/500mA
> respectively when the HW reaches the OTST1/OTST2 thermal level.
> 
> [...]

Applied, thanks!

[1/1] leds: flash: leds-qcom-flash: limit LED current based on thermal condition
      commit: 3db5127c28f8faa1c245588ab982f72d033e1de4

--
Lee Jones [李琼斯]


