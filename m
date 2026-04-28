Return-Path: <linux-leds+bounces-7866-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GJ2J5kQ8GmANwEAu9opvQ
	(envelope-from <linux-leds+bounces-7866-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 03:42:49 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1329F47C80D
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 03:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3663301106A
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 01:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99652D1303;
	Tue, 28 Apr 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWNdjQ6G"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DFDF6C;
	Tue, 28 Apr 2026 01:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340565; cv=none; b=oe8878sCn0hwcj7JdOTItg9L4E57tWaNzI2XpAFtoGWJUUaOsb+7ENynQXb4dArvRKu2Qa+fcxoR4XLGk4G4RITSMHciiNgwnGgHFb8VdC29D5EC0/zNjbDPrYrDsb3B1qIDBEaFmqXixTP9BcWfDR9xwKotbifMTk3VOhbeuxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340565; c=relaxed/simple;
	bh=6cqbNEfZcOl5F5GbJtrNb3xDjtNGuT/O67xGDBTHb8Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VpfKzx6Sxvav2n+QpkCm/8O+Ca75vH/FRPUxbeKFsNoblFbd5NWqZJez9ZOCow/OhfIhvwBABU5faDrkdVYe4srarImU+VyIDcSa69UinkWoDVFKUkS2DHdS8Ye9xa/eGrs4bQ0XC8mwNYJYy6yhpnoJpt+s/fFDWtxlG02yueE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWNdjQ6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA9EC19425;
	Tue, 28 Apr 2026 01:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777340565;
	bh=6cqbNEfZcOl5F5GbJtrNb3xDjtNGuT/O67xGDBTHb8Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eWNdjQ6Gg6LDCPIKdTxMntlJGX+UmVb7kePIMwuM0Z/gF28z0LTCXcNpUzn/GEZse
	 CF0JYKTjg4/iOXg7VgOY+LKZ3iqnNW0E/X3je5Lnqh+SoA/VT9hjLNpf5+j3zPWW8O
	 rhqcxDNJmSxDm8agu/+g/zdEEVtLYEWigMfXUE/bBAxOJMy7rwhpfFcyliiB1n4Fdo
	 yQzOAJtMFeBdviWq6ImqYSA7doXFu+RX6WAPokZI7brFhZRLr3KP6qDz6ikBBaUG/I
	 /E8hHWEAUcUc6JTKmiSvF04kkFI2s3azeCXJ/1Zj5sAkvhzY1RII7w5DtdAUOwnmq7
	 E8740wFb0lUxQ==
Date: Mon, 27 Apr 2026 20:42:43 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: pzalewski@thegoodpenguin.co.uk, devicetree@vger.kernel.org, 
 krzk+dt@kernel.org, luccafachinetti@gmail.com, conor+dt@kernel.org, 
 linux-leds@vger.kernel.org, daniel@zonque.org, lee@kernel.org, 
 linux-kernel@vger.kernel.org
To: Jun Yan <jerrysteve1101@gmail.com>
In-Reply-To: <20260428003412.322032-2-jerrysteve1101@gmail.com>
References: <20260428003412.322032-1-jerrysteve1101@gmail.com>
 <20260428003412.322032-2-jerrysteve1101@gmail.com>
Message-Id: <177734056311.4191670.5747329049193393.robh@kernel.org>
Subject: Re: [PATCH v1 RESEND 1/5] dt-bindings: leds: is31fl32xx: convert
 the binding to yaml
X-Rspamd-Queue-Id: 1329F47C80D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[thegoodpenguin.co.uk,vger.kernel.org,kernel.org,gmail.com,zonque.org];
	TAGGED_FROM(0.00)[bounces-7866-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thegoodpenguin.co.uk:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


On Tue, 28 Apr 2026 08:34:08 +0800, Jun Yan wrote:
> Convert leds-is31fl32xx to DT schema format.
> 
> Co-developed-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Signed-off-by: Lucca Fachinetti <luccafachinetti@gmail.com>
> Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  .../bindings/leds/issl,is31fl32xx.yaml        | 163 ++++++++++++++++++
>  .../bindings/leds/leds-is31fl32xx.txt         |  53 ------
>  2 files changed, 163 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/leds/leds-is31fl32xx.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/leds/issl,is31fl32xx.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260428003412.322032-2-jerrysteve1101@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


