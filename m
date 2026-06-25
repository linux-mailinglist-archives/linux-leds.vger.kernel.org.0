Return-Path: <linux-leds+bounces-8743-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D3vHLl7nPGqZuAgAu9opvQ
	(envelope-from <linux-leds+bounces-8743-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:31:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE06C3D1D
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 10:31:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MsJJb3sH;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8743-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8743-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD76304409D
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jun 2026 08:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487D13806D0;
	Thu, 25 Jun 2026 08:25:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2562C3803DA;
	Thu, 25 Jun 2026 08:25:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782375958; cv=none; b=TRjKSiDg6r9jzGjt+HZwmH+4IUCtr7dQBjVQaX3XDBw58zcETvTLFqBvLikY0fZrWz+3kab1YgymIUrz04AUAW45PJiq7snKtA8u2XWg4oYCYKRoqVN1f3TUExRAFmp4Na1cx3t7vKLZV2FPQQdIFAudBe3apuyZUPFJ/NDCHWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782375958; c=relaxed/simple;
	bh=nioTCmPU+3eWZ+mVwk4Hy7ZZSWwSbIlHuVOftDsQGyc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EyCNMVs886taakChDu5mrk/KtXfg40OojZ+7y9p0HzDynrv8a2oIP86bM8n0SU4bcO0sTMykL/YjrBjuiVU+EHLHgs31PzwTNqfVnw6IgLrTpAO3VDdiH8aO1nz8hBiuGov0f46yr+fFCHQckbPZYsesBeKWmnmOH7Hu8HwG288=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsJJb3sH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EAA1F000E9;
	Thu, 25 Jun 2026 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782375956;
	bh=354NPE8AP7arpQosrf7bkBmCMHrDGRR+bntXsxfJAlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MsJJb3sHZ3oEe+WWbdqauiG3A/grjbCWE3PSBatzR5jqSk8ApKLBd2jzw5w3W5D17
	 +hekyYafmG9MykvRU2MUtrs/oKrOs6ucFFeyHfTK/jFDgJUIk+7trZBsAMOuxnYgTQ
	 AastkE0dN51nFQ9S2/vvGOhXlCf0P3NActSFXGL1HZ3EvUDs4pSBXXL80AG85MNcFO
	 Whcdb8aepTzwL8n+jWoHh4/qVNKR3PLUC/K/P+SY0q5B2+O1rzSH2/TduXT/iL89AV
	 FGyq7bqphopLnkjTViC4Ttvrh2nN1Q8bOO+8NUmW63FZf+CglFast3QzSePTRl8iJf
	 FICwm5qESN84w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260625081529.22447-5-clamor95@gmail.com>
References: <20260625081529.22447-1-clamor95@gmail.com>
 <20260625081529.22447-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 08:25:56 +0000
Message-Id: <20260625082556.65EAA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-8743-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:robh@kernel.org,m:linux-input@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:lee@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-leds@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qmqm.pl:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61DE06C3D1D

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Explicitly calling `input_unregister_device()` on a device alloc=
ated with `devm_input_allocate_device()`.
--

commit b1b4cf8c044b790c2019bf0bb44a52ad2de52358
Author: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

input: keyboard: Add driver for ASUS Transformer dock multimedia keys

This patch adds support for the multimedia top button row of the ASUS
Transformer's Mobile Dock keyboard. It tracks keyboard input events for
AltGr presses to switch to multimedia keys.

> diff --git a/drivers/input/keyboard/asus-transformer-ec-keys.c b/drivers/=
input/keyboard/asus-transformer-ec-keys.c
> new file mode 100644
> index 0000000000000..53aff3ce7146d
> --- /dev/null
> +++ b/drivers/input/keyboard/asus-transformer-ec-keys.c

[ ... ]

> +static int asus_ec_keys_probe(struct platform_device *pdev)
> +{
> +	struct i2c_client *parent =3D to_i2c_client(pdev->dev.parent);
> +	struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent);
> +	struct device *dev =3D &pdev->dev;
> +	struct asus_ec_keys_data *priv;
> +	int error;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->ec =3D ec;
> +
> +	priv->xidev =3D devm_input_allocate_device(dev);

[ ... ]

> +	error =3D input_register_device(priv->xidev);
> +	if (error)
> +		return dev_err_probe(dev, error,
> +				     "failed to register extension keys\n");
> +
> +	error =3D asus_ec_keys_register_handler(dev, priv);
> +	if (error) {
> +		input_unregister_device(priv->xidev);

[Severity: Medium]
Since priv->xidev is allocated with devm_input_allocate_device() earlier in
asus_ec_keys_probe(), does explicitly calling input_unregister_device()
here in the error path lead to a double-unregistration when the managed API
automatic cleanup triggers?

> +		return error;
> +	}
> +
> +	priv->nb.notifier_call =3D asus_ec_keys_notify;
> +
> +	error =3D blocking_notifier_chain_register(&ec->notify_list, &priv->nb);
> +	if (error) {
> +		input_unregister_device(priv->xidev);

[Severity: Medium]
Could manually unregistering the devm-managed input device here in the
notifier registration error path similarly cause a double-unregistration?

> +		input_unregister_handler(&priv->input_handler);
> +		return error;
> +	}
> +
> +	return 0;
> +}
> +
> +static void asus_ec_keys_remove(struct platform_device *pdev)
> +{
> +	struct asus_ec_keys_data *priv =3D platform_get_drvdata(pdev);
> +	struct asusec_core *ec =3D priv->ec;
> +
> +	blocking_notifier_chain_unregister(&ec->notify_list, &priv->nb);
> +	input_unregister_handler(&priv->input_handler);
> +	input_unregister_device(priv->xidev);

[Severity: Medium]
Does bypassing the automatic devm lifecycle by explicitly calling
input_unregister_device() in asus_ec_keys_remove() on a managed device lead
to double-unregistration when the device is unbound?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625081529.2244=
7-1-clamor95@gmail.com?part=3D4

