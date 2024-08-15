Return-Path: <linux-leds+bounces-2441-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19087953BB8
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2024 22:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C83F0282D83
	for <lists+linux-leds@lfdr.de>; Thu, 15 Aug 2024 20:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9B4158A36;
	Thu, 15 Aug 2024 20:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoMADpcf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A908158A09;
	Thu, 15 Aug 2024 20:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723754472; cv=none; b=UTpt4+P2h4vHgQP9U7Q7N20QMNKy6twlFp0uiEq52FT4eKn/vZ8BqjUlxITnTmNlBB9GOOQ+tXq36QCETKgTXvMgwioXrI0SHGaPCK61bMaUHphotVQ1ltNH2JCGZk8lYnP7ntZnnmTT0G9N6QwWJj5qzUhQwS8YayXUFUB73CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723754472; c=relaxed/simple;
	bh=3UHeNZxS3i81xvXgLPNVUWlT7A79VtbCBAK5BIJPHU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWNatDijE4m8+088rG5fpV+q8WYHcxkQT0rGuRLfYy1J76N2SjwKV6gMGRKRpHsmbru1Cp02B0l588dpJfc50UwMuuJmRgJ4y1tP+2NvNymfkPLfxkVQ64LbjLX33wN7Lew59SzCr9ROj9t5PBOtBVtSP+matOEA479WVOQPpvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoMADpcf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABEAC4AF0E;
	Thu, 15 Aug 2024 20:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723754472;
	bh=3UHeNZxS3i81xvXgLPNVUWlT7A79VtbCBAK5BIJPHU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qoMADpcfRQBZTbCjXYXRS6d+uHyla0CW7msG547JGJy5ggJOt63SQNyINSfQSXW9O
	 2V1vacx5zwYVrZnrc4BvO8FYNviaXJ8VfDI2LLrYGTtGmGFGnXjU8D71nGquILD+mz
	 79fxA/p3yXy70LxfNdkwPUHeIOket054GVr83FPqhNkks1t+NOXNB5xKSj/6z645wv
	 mhNbUPMOvBf0AbktPRTNYLBcuO1yCcsb5tsuMw2AcWPpYurg15sZzHYymi+NIoiq2A
	 48tqa2p8Tn+oQ7x/CFBJIWNJoY8KZFh8CCRA9qmUKbxthO7mqkCnxlqRLXJdc5DSWU
	 3pXOXcRW8/Xpg==
From: Bjorn Andersson <andersson@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH RESEND v6] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash
Date: Thu, 15 Aug 2024 15:40:27 -0500
Message-ID: <172375444816.1011236.9460813836275052885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729-sy7802-v6-1-86bb9083e40b@apitzsch.eu>
References: <20240729-sy7802-v6-1-86bb9083e40b@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jul 2024 23:23:04 +0200, André Apitzsch wrote:
> The phone has a Silergy SY7802 flash LED controller.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash
      commit: 04b2f8d5aec32973d34839ae983821857924cc66

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

