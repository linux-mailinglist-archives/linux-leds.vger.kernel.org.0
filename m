Return-Path: <linux-leds+bounces-7376-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAKyF/hjumklWAIAu9opvQ
	(envelope-from <linux-leds+bounces-7376-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 09:36:08 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F432B8252
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 09:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DB9A30747BC
	for <lists+linux-leds@lfdr.de>; Wed, 18 Mar 2026 08:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ACE3815D7;
	Wed, 18 Mar 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iEHtYkkR"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668EA3815D1;
	Wed, 18 Mar 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822644; cv=none; b=Iq87//7L/v4d3CgFiOtjO2GIhs/m5XRLDZ9ETsM0+nASbnr4ug+kWTfGnFVzGXRxcQnuEZlEMGSr9ae8Ibz3v8HGbbnYiRMWoCvQYPhgsK6ugwkZOZ0dSuFXKf0dLkusGmaZjBHSeZqm7DoFGjRckd4D7r5nzotcxWqqMiB6fDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822644; c=relaxed/simple;
	bh=4gEpdj+B3E+g2ulHMof+b7zyL8wfwZPsza6dZPL37nw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=G3ZVd2QSCN944AWKDwD+1HlRt1cIx4uGzmnBNxp/ygHH0meSdlIHzNsNw2Zjg7K2cHhNHdc9cUvPH96a+DKaIZglS1QX+2GTHJYvYIfmr4IA8yLFf08B/PTylIEERPT349UwCDZ9fr7z0AMNfQ5lPKtzIx30tGfsh3MsMSf7I+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iEHtYkkR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD61CC19421;
	Wed, 18 Mar 2026 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822644;
	bh=4gEpdj+B3E+g2ulHMof+b7zyL8wfwZPsza6dZPL37nw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iEHtYkkR2L1/aUU2Q82PAreCa57WqmriBDYH9bj3gmA0J7N2XQt4ICZohHPRu1cDg
	 oICOs3rbnljrHf+BnrBcCZyGqqVhM4ASEujG8ri9btQqisIr4Mk5/goh2flGHOq8yM
	 lajFTK3M5eV3L/g6pXYc6kS/kbto/1LpC3sknClNaqANPMlMG1LzsMTgq8Iyid76Fd
	 HquRtpWIwzLnr24quSOBgjSpQ81alUn8y2Kp2alDlKFleJL+mkkrDe5raJNoTuAUMq
	 7COV+xBXOKvsEovSuDVbj95GudFKxfxW2knif4zksu2ZUfHi7PG7a9/2gHYHnZ64rU
	 1ImLBY5ErR6+w==
Date: Wed, 18 Mar 2026 03:30:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
 Lee Jones <lee@kernel.org>
To: Jan Carlo Roleda <jancarlo.roleda@analog.com>
In-Reply-To: <20260318-upstream-ltc3208-v1-3-015f1f1e9065@analog.com>
References: <20260318-upstream-ltc3208-v1-0-015f1f1e9065@analog.com>
 <20260318-upstream-ltc3208-v1-3-015f1f1e9065@analog.com>
Message-Id: <177382264300.2517688.18315144921820814941.robh@kernel.org>
Subject: Re: [PATCH 3/3] dt-bindings: leds: Document LTC3208 Multidisplay
 LED Driver
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7376-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,analog.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03F432B8252
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 18 Mar 2026 14:59:22 +0800, Jan Carlo Roleda wrote:
> Add Documentation for LTC3208 Multidisplay LED Driver.
> 
> Signed-off-by: Jan Carlo Roleda <jancarlo.roleda@analog.com>
> ---
>  .../devicetree/bindings/leds/adi,ltc3208.yaml      | 159 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 160 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/leds/adi,ltc3208.yaml:20:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/leds/leds-ltc3208.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/adi,ltc3208.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260318-upstream-ltc3208-v1-3-015f1f1e9065@analog.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


