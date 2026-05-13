Return-Path: <linux-leds+bounces-8094-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCb5GpHRBGr0PQIAu9opvQ
	(envelope-from <linux-leds+bounces-8094-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 21:31:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B6E539F85
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 21:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92EC931B01D2
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 19:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1567F3B895F;
	Wed, 13 May 2026 19:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQyfqJi+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB63B27E9;
	Wed, 13 May 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699385; cv=none; b=NGyUkkZI9iM8VtVGP+fisKieZbYbjAnMkkunCK+q1TEVWwI+fXNhORP5LYsGv0x/FGJLzbNVbnQDqwSchnEJJuB2w3Bj/4loE6uB0NuKsya2L/qMd5RZJ22x6UgodnwXBOlt/nTgsiWG/Uf1ETWWTlF+c/fRGHJbRhlcMItULbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699385; c=relaxed/simple;
	bh=ZrxSSOGRwTmT5lYy+RYdzMYoYwrG122Z6wsIuaPplk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWZfF4XGAuyzJYKiaCATSYqGF7BZqFDNyEHVwWRy2rs7r6kEJ9ko4xmTEWKi+/KBa5n5SVNBHdlR5/tHVQv3g48Jy4cdjsiFaeyszLpcLG1H1jxfBR603NNb3/awwoMrEvkozLsH+9ycELsXzzyHD1v7vFlopDOdpKj9dEH46ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQyfqJi+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A367EC2BCC6;
	Wed, 13 May 2026 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699385;
	bh=ZrxSSOGRwTmT5lYy+RYdzMYoYwrG122Z6wsIuaPplk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cQyfqJi+Y8I6p4u+Wi2u8asITSWWgtP/YVeAUjh4L6dAshDsOzOlC1dvczbFLQV/0
	 BXNmS9b9Ep42mp/ML7azHJWg85osuYjkbo7TA2HRriDAKgjhir9X2k5QQapgAkNs3z
	 mZ1McfvPt15s7Rqx98eJYyRaSenBo2xq3CB4q2O6N+vz1zhTHocF4bec4Hm0tLNHND
	 QPgd/a0++4e6kQdbsFufACQ8VFfyaSrx8X1dzIvCdvKHSUS6oFSllCQEWi59ua6FS+
	 sXZW1vDkav6uPw451Om17fuHm6LqOiJwiuDc5Y/XQQE3GxthWMa+5mjU2zpe5hJOL7
	 vWdIRudyri4Zw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/7] Add vibrator, IR transmitter and USB-C handling in xiaomi-ginkgo
Date: Wed, 13 May 2026 14:09:24 -0500
Message-ID: <177869936442.1496622.16143301143443320986.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B9B6E539F85
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8094-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,mess.org,baylibre.com,somainline.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Mon, 30 Mar 2026 10:13:47 +0000, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> [...]

Applied, thanks!

[2/7] dt-bindings: clock: qcom,sm6125-dispcc: reference qcom,gcc.yaml
      commit: dbabf6a32ffb69a604f966ec01a20a060836939d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

