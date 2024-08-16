Return-Path: <linux-leds+bounces-2469-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A392954FA6
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 19:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE6E1C222C1
	for <lists+linux-leds@lfdr.de>; Fri, 16 Aug 2024 17:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56CF51C0DF7;
	Fri, 16 Aug 2024 17:11:30 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtprelay05.ispgateway.de (smtprelay05.ispgateway.de [80.67.31.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B4558A5;
	Fri, 16 Aug 2024 17:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.67.31.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828290; cv=none; b=lrEEzMbGCb7Cfwbe7x6qJ5dq2MI7TyeC+ozrEumfnSZZ58qUfbeJrGKfQwmwbEjp2e02TC/dbujV/fAmkcfy97AormjdBl5zDSvbegkyz4qitlQcaRctO3y/cZB64FVN22wFkCq6AUaphU5QFifYtBSKjp79A7rh1+VBcB31ftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828290; c=relaxed/simple;
	bh=OQj9aflFz5/1xZELeYBBSnRGJvXqvpt8ZmmFo5/oPpY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TyXODleqR4kTyuHbIiKD6E1f0+IGmqagq618CU38c2sYGmO8BJxL7XWMw60/XJXR2RQhV4KbWsxQtVgdDLvJeUS65e2Yse2V1bQVBsJAV2Gk/DV/tNeR7olKfoH2pPxlqMrzvvJ6SpoZi3EJ/YqpQBE6i3deIOmz/V9X7lm4IiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; arc=none smtp.client-ip=80.67.31.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
Received: from [77.64.252.82] (helo=framework.lan)
	by smtprelay05.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98)
	(envelope-from <git@apitzsch.eu>)
	id 1sf0TS-000000000nw-3QWQ;
	Fri, 16 Aug 2024 19:10:50 +0200
Message-ID: <f50d7129b6023d89d7c83820d9f69075800fe1ae.camel@apitzsch.eu>
Subject: Re: [PATCH RESEND v6] arm64: dts: qcom: msm8939-longcheer-l9100:
 Add rear flash
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,  Trilok Soni
 <quic_tsoni@quicinc.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees
 Cook <kees@kernel.org>,  Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Date: Fri, 16 Aug 2024 19:11:29 +0200
In-Reply-To: <172375444816.1011236.9460813836275052885.b4-ty@kernel.org>
References: <20240729-sy7802-v6-1-86bb9083e40b@apitzsch.eu>
	 <172375444816.1011236.9460813836275052885.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=

Am Donnerstag, dem 15.08.2024 um 15:40 -0500 schrieb Bjorn Andersson:
>=20
> On Mon, 29 Jul 2024 23:23:04 +0200, Andr=C3=A9 Apitzsch wrote:
> > The phone has a Silergy SY7802 flash LED controller.
> >=20
> >=20
>=20
> Applied, thanks!
>=20
> [1/1] arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 04b2f8d5aec32973d34839ae9838218579=
24cc66
>=20
> Best regards,

Hi Bjorn,

It looks like you applied the patch twice (two different version)[1,2].

Best regards,
Andr=C3=A9

[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?=
h=3Dfor-next&id=3Df98bdb21cfc94cb7733a5c3216e8f1dec1c06023 (v5)
[2] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?=
h=3Dfor-next&id=3D04b2f8d5aec32973d34839ae983821857924cc66 (v6)

