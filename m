Return-Path: <linux-leds+bounces-8805-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AnPFNSlvQ2qDYQoAu9opvQ
	(envelope-from <linux-leds+bounces-8805-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 09:24:25 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D76E11A3
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 09:24:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=K3HSrKWb;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8805-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8805-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D5666300BC7E
	for <lists+linux-leds@lfdr.de>; Tue, 30 Jun 2026 07:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94B339903B;
	Tue, 30 Jun 2026 07:24:12 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909A39A7E1;
	Tue, 30 Jun 2026 07:24:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782804252; cv=none; b=FtrN7wFlOo40MzKQEYLme2w9Rj50mpmwr3lYm+HX/+rCBMRnqwP7dq7+9UbkOkn4NVyOccibCD+92jOCRouPcEWa1N2v/8sBhjsqlDj9Ia/l3JAxCMUwWc8Xl1Y2g3u6izaCTzm4ORiU0rGdpYOUh+0Kh8gRMrWaa+sosAiAdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782804252; c=relaxed/simple;
	bh=O1MTdSeMChmGuLCFMQLb5LEb1VBQ6GGvYCURhlS9KzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAp3qupriXKSOYeRxbuBcqMzyLXzpkJ7dNfyQNlTLGPOxpHCyWrhKG1lO2FY94/mt/GuHvVUWXi42kXgeHXjbSQOCSD58/RPr3JyP4Ij+dW/CvNjSjLXGG3idAxp9mv3frAMxLXMF1wFhLWc52uBcpUk6HDzPkmzhGV5ROusLmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3HSrKWb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A953E1F000E9;
	Tue, 30 Jun 2026 07:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782804251;
	bh=O1MTdSeMChmGuLCFMQLb5LEb1VBQ6GGvYCURhlS9KzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3HSrKWblIGt6qprwc8g2ASw0aKsz0NorwrMtpIriWgtXQkBnMuGE9/jjOh+eESph
	 P7FPRaDhPTKgxTI4oFhOBUeD2aEE9gK+utxyit6Suc/Ffe+c0fdTYH/Gh+7++bOQzC
	 DrzC1l9eHrxZ58/MAy0wRAWj86qOluGxsRjbmJpooBA/6ARA49VEqIbhqZvO1rcB5G
	 udHf/mBNt41erzIc2CkTq0KR4GS11wEPCX+1UgTZkLyJSHqXKS2TWGY+jWvrLLSvXl
	 NavaIpZTbjTdjD9D+8P49i/ddWwagfW9V6tBcwmXJQDv6Fgz+NgPTAf2FvUV50IGOY
	 enUxGXN0KaKXA==
Date: Tue, 30 Jun 2026 09:24:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Message-ID: <20260630-alluring-gentle-sidewinder-f37696@quoll>
References: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
 <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629-monza-leds-v1-1-0cf7c0a7dc14@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-8805-lists,linux-leds=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,quoll:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D09D76E11A3

On Mon, Jun 29, 2026 at 09:52:07PM +0200, Loic Poulain wrote:
> Add support for grouping individual PCA963x channels into a multicolor
> LED by introducing a multi-led@N node pattern. This follows the

And why do we want it? Here you explain why you do it.

> convention established by other multicolor LED drivers such as
> kinetic,ktd202x.
> ---

Run checkpatch

Best regards,
Krzysztof


