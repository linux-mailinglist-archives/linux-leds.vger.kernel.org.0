Return-Path: <linux-leds+bounces-1914-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB619078D1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 18:54:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0821F23896
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DC31487DF;
	Thu, 13 Jun 2024 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZn8K0bP"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495512F386;
	Thu, 13 Jun 2024 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297674; cv=none; b=Xqw3U9S9iJwFbNS4g6QKhxfVWJMLu6H653o0+kQEXLX2kLurxQpuY4lXg/z2xgBfw46xpxIJk+pbMXC20OYHp/AqV4MyF6C7jBf5u+p64zcmugnncEGn4DJUpCAJ5cZaeIzIg56aDrHzlhApbfY0TR8UJ5xCl4kEf1UZtxc2H5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297674; c=relaxed/simple;
	bh=cOpWMtjOpM5JcUJn8Jsy0W8BZXiFPPhfC6HaQXCrUYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TrALSs/EJcTTGHNdnH1lfg9OGOLajvlWF2FRj5wh3gmI+CrSaOI58a379SAi2rggrm3lmDE9A2XqRjmMHzqazn9iuczegy7q29UP5IGZ1seI899oFsQaYBK14HsmBQTlhljv5V5Nr0ochiRBYbpcgDXPBd9RWaIOtCmTqhqVJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZn8K0bP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730F6C2BBFC;
	Thu, 13 Jun 2024 16:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718297673;
	bh=cOpWMtjOpM5JcUJn8Jsy0W8BZXiFPPhfC6HaQXCrUYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CZn8K0bPASERaMkg6FivPqE7oz1NO1AI05YeBwF12OplA91xivbCrjr1cMPGhUvtx
	 R2G9W7gYRXRMqpitU2MMRy4i6s2Yael1uvYKMA1+Sj1KP6nlSIPcHZuyHPOd/gN/Vw
	 b7G6cYITwP+1BuoNFnbA0vizonkzpK579t9QUsTsR/mafPUPGmMxnHsZRs1Cnglj8s
	 MiGtJnIMEIbimz4Q0gewcIVdI2NXa/CO9EIik1xtq+j9rS4DOsVXAc/5HZFcdDRRfC
	 jTqRlHslnPA+MZ4SCD0X67nhkiwJXWUPM6QpUOWqcE3uoli2/4ahCHqTCxnHspHMsJ
	 tAmmebEJ4p33g==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, robh@kernel.org, andersson@kernel.org, 
 Anjelique Melendez <quic_amelende@quicinc.com>
Cc: u.kleine-koenig@pengutronix.de, marijn.suijten@somainline.org, 
 kees@kernel.org, morf3089@gmail.com, quic_gurus@quicinc.com, 
 quic_subbaram@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240607005250.4047135-1-quic_amelende@quicinc.com>
References: <20240607005250.4047135-1-quic_amelende@quicinc.com>
Subject: Re: (subset) [PATCH 1/2] leds: rgb: leds-qcom-lpg: Add PPG check
 for setting/clearing PBS triggers
Message-Id: <171829767121.2715617.1437824058058864879.b4-ty@kernel.org>
Date: Thu, 13 Jun 2024 17:54:31 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 06 Jun 2024 17:52:50 -0700, Anjelique Melendez wrote:
> Currently, all LED LPG devices will call lpg_{set,clear}_pbs_trigger()
> when setting brightness regardless of if they support PPG and have PBS
> triggers. Check if device supports PPG before setting/clearing PBS
> triggers.
> 
> 

Applied, thanks!

[1/2] leds: rgb: leds-qcom-lpg: Add PPG check for setting/clearing PBS triggers
      commit: bdd39a590cec198d4208ef4dd375971dbd079b5e

--
Lee Jones [李琼斯]


