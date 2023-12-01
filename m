Return-Path: <linux-leds+bounces-224-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCE800809
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 11:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 166B9B210D0
	for <lists+linux-leds@lfdr.de>; Fri,  1 Dec 2023 10:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85417208C8;
	Fri,  1 Dec 2023 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMW3RKlb"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699231F934
	for <linux-leds@vger.kernel.org>; Fri,  1 Dec 2023 10:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71E6C433C9;
	Fri,  1 Dec 2023 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701425691;
	bh=eYyPWc2lkrp1q278xtHSsN8K+ZBkth5SWIXoDcGBOyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jMW3RKlbeSARjBxiL7ymqYH+s50gAf6vaMmDf4hzwZxXHsgFR5PAdihyb7NJnb/pQ
	 fFLZHAxGF/QLkPf7dtirNKyH8bjPuhBDKLnBpCxzQVzeO/g9eacQ59Bz6etVS5o6fS
	 gHnqC8cy62XI2SXgKkcUn3cd3A8JOXjy9OpqoM3EZKf0S3ZNPuI2Lj3Jp7p72mc/4T
	 QEP/5FRgpQPdjahwO46rKEMTT1h4rmAmU4qeF3h1uWKex1T4k6l/xk47yz3mpG486A
	 nZNQN1W2PK47NwAv6tPaobIdYCfZwDjPRWMJUnFmuFvkzCDu5zASStc6A6c46QpTE2
	 nb3U9x6UwWpPw==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Anjelique Melendez <quic_amelende@quicinc.com>, 
 Lu Hongfei <luhongfei@vivo.com>, Luca Weiss <luca@z3ntu.xyz>, 
 Kees Cook <keescook@chromium.org>, linux-leds@vger.kernel.org, 
 kernel@pengutronix.de
In-Reply-To: <20231126095230.683204-1-u.kleine-koenig@pengutronix.de>
References: <20231126095230.683204-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/2] leds: qcom-lpg: Two cleanups
Message-Id: <170142568953.3337368.14411904860481508980.b4-ty@kernel.org>
Date: Fri, 01 Dec 2023 10:14:49 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sun, 26 Nov 2023 10:52:31 +0100, Uwe Kleine-König wrote:
> while looking at this driver for some pwm related changes, I noticed
> these two patch opportunities.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>   leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
>   leds: qcom-lpg: Consistenly use dev_err_probe() in .probe()'s error
>     path
> 
> [...]

Applied, thanks!

[1/2] leds: qcom-lpg: Use devm_pwmchip_add() simplifying driver removal
      commit: 45ca7c7608707ad9ba68be30067577e88267c62c
[2/2] leds: qcom-lpg: Consistenly use dev_err_probe() in .probe()'s error path
      commit: 7999cb13c04c4769a51c7366f967adba2bb8583d

--
Lee Jones [李琼斯]


