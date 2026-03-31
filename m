Return-Path: <linux-leds+bounces-7599-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJjdHmx0y2k3HwYAu9opvQ
	(envelope-from <linux-leds+bounces-7599-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 09:14:52 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E448364E7D
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 09:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 40CB630229AB
	for <lists+linux-leds@lfdr.de>; Tue, 31 Mar 2026 07:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45AC3BBA1E;
	Tue, 31 Mar 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txU8DoCI"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB883B8BC7;
	Tue, 31 Mar 2026 07:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941136; cv=none; b=iVg7cqIMLxd6ncv23MCrcRB09w+PAO73o+jb+dlzUEH6YbaKLMpSVEIDuPKEAk0bvtQaAfqp1fi5sELsH08T2DVwA9eZI9VlD+yNwPkbmyU/a0aKXRbSJKN2e+UjAVXhYczO7AM0drFtWgkEhHgWGkRv3dx5OkTwIQRn97hubt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941136; c=relaxed/simple;
	bh=Kc0h2LUXfpk/OPz4l2zC+M+UaLPdJ/DnMWZCprnyUrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doC400IlDYcaGkD29nxjJoWpX012FyvBdv4yzx7jR25VmbzM+R0PTDxnvPyE/E9fNOyJPVZ+XiayOOvfsQmTdsW5uoqrTvRMH4D86zTXVtkWKqhlogmM7gP8nzG5qAcj+L5o+ztMrMhYPO7oktV/BcUFZCpPg2wQjWjXG01//Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txU8DoCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AD00C2BCB0;
	Tue, 31 Mar 2026 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941136;
	bh=Kc0h2LUXfpk/OPz4l2zC+M+UaLPdJ/DnMWZCprnyUrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txU8DoCIzXXAW41TKPYGOeH4ap3KoJCKUdaps1grmk4pS0mxrJPhJTsv1dOtUzdi8
	 +OcGxoKvQVLzHUMFgP1o7TIqgffoOILB4s/glQo+L4O8v5YfhU7afyGBXwoJRq/9XZ
	 npW3qNp8v+dgGYlx+Gp7YKVBccwUKaUOaGYgvImiGRd9rpcmwsEMgbzcL0f87S2ARn
	 +uB/a6SFKWS1z8++D5qRr7RGdA1kkIVlHkqFHdgleUi6CszgmstokHRUZE947JqqKC
	 H6AfSfwwdIBOWykxSvobKShggxlOwBNsx5LLKDH2/FWFJMRzUSNXhkItPls74q2tl2
	 76dPHYJgWy5rg==
Date: Tue, 31 Mar 2026 09:12:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-clk@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom,sm6125-dispcc: reference
 qcom,gcc.yaml
Message-ID: <20260331-knowing-echidna-of-courage-24cf5d@quoll>
References: <20260330-ginkgo-add-usb-ir-vib-v3-0-c4b778b0d7f8@gmail.com>
 <20260330-ginkgo-add-usb-ir-vib-v3-2-c4b778b0d7f8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330-ginkgo-add-usb-ir-vib-v3-2-c4b778b0d7f8@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7599-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 1E448364E7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 10:13:49AM +0000, Biswapriyo Nath wrote:
> Just like most of Qualcomm clock controllers, we can reference common
> qcom,gcc.yaml schema to unify the common parts of the binding. This
> also adds the '#reset-cells' property which is permitted for the
> SM6125 SoC clock controllers, but not listed as a valid property.
> 
> Fixes: bb4d28e377cf ("arm64: dts: qcom: sm6125: Add missing MDSS core reset")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603150629.GYoouFwZ-lkp@intel.com/
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc-sm6125.yaml   | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


