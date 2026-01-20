Return-Path: <linux-leds+bounces-6690-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJLKCoG0b2nHMAAAu9opvQ
	(envelope-from <linux-leds+bounces-6690-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 17:59:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9E44831E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 17:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4152986109
	for <lists+linux-leds@lfdr.de>; Tue, 20 Jan 2026 16:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5034611CB;
	Tue, 20 Jan 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jH/ZPx2g"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8204611C6;
	Tue, 20 Jan 2026 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925500; cv=none; b=p9D7nI6PoUAz1aB1+rC554FSRFwk0RoerMI7/7tGI/QQx5tg7C72yIpp2/t6gLz+F+j1o3zUKJysvjHe8aH9XrwccbukbJ+2hRBFIS146bZGsrKAYaFWz4WHjBj/Kpe6fTs2QaalD6yyeXtq8DkcHnlED6qwh++/cBdrhJg5yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925500; c=relaxed/simple;
	bh=2FdcTFUlXpxDIcJam3HB9XSvIJ6QLNxj/aGtOw/ODP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NcKYvHyiC6zidkn0ABSIJJq5dsOwuzIxDEqdSstWXF4wsNpuIopGijYOHMzt83QINSbxM7pgMpi/hZsKHlbfgtNNkrWTHyTf3YFQq63gBG/qV68deRJmh4LkhnUF3m4p+fu8KmH3D7GScWT2IpzwkEyT9Tn9ERpXCu+JHAYso2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jH/ZPx2g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1419DC16AAE;
	Tue, 20 Jan 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925500;
	bh=2FdcTFUlXpxDIcJam3HB9XSvIJ6QLNxj/aGtOw/ODP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jH/ZPx2gWbRebxjOoKg+5ouEIEXHMz1aLGJnqTktnLXyRzw7bF7hLNpoF/+9gBJKa
	 IpXwipXYDYnndxPxUnwh3mCWId8Bmygsi1Ir/Tb6QTF2MNOku3a0yVLD2q8tsxEIke
	 u2J3uaAb/jzNH5RjzKq61oDyixL0RLK8MU1CmLl1b6hHASi2KbXy4PsOC65dU0qnIs
	 quirRPcH+Tj5ASP+6fYWS10E87Kj35yw7t/3y02KFRs7Yb8LtDUTXemWNEs+KPuaeY
	 xnlD8MPk1P0l7pnY3bAwWzMHhBs9K8tYSL9aUnR5KtqEq8R3z2J+feuwEeUQXCw51x
	 xSPiHFpwXWpUA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 aiqun.yu@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com, 
 yijie.yang@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com
In-Reply-To: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
References: <20251215-knp-pmic-leds-v3-1-5e583f68b0e5@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 1/2] dt-bindings: leds: leds-qcom-lpg: Add
 support for PMH0101 PWM
Message-Id: <176892549681.2317951.17154378493870916934.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 16:11:36 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-6690-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: BC9E44831E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 15 Dec 2025 16:41:04 +0530, Jishnu Prakash wrote:
> Add support for PMH0101 PWM modules which are compatible with the PM8350c
> PWM modules.
> 
> 

Applied, thanks!

[1/2] dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      commit: f23ead3e84085cb6119ff07584b9e30a89ee30c4

--
Lee Jones [李琼斯]


