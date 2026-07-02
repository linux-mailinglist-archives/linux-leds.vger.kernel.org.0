Return-Path: <linux-leds+bounces-8896-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u0OiNZPrRmoTfgsAu9opvQ
	(envelope-from <linux-leds+bounces-8896-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:52:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A346FD4F6
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:52:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="GeKS/JEN";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8896-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8896-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8290630137A3
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBCD3D16E9;
	Thu,  2 Jul 2026 22:50:54 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CE3D093F
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:50:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032654; cv=none; b=rEX5RlOjPdCcwfA8ZyaoMsEaLoLv9UHiPor2OiSFZdUb4IgUEdf4wMEMn3t10m6tTdLKYu7Wmf157t5wJmwEXa77kHhcK5SyxknswdwboIgw+OahAGip4LH9BfQqSloJzwgtFBisANQe+8kLNHjfiJYrXf9W9wZnvTkthj/n7qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032654; c=relaxed/simple;
	bh=7QIBDu3UG8GNmL5HUTTK0jOc3gmjbh1Vy4Mj4jXBdy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kPCw9r6RgG4JMPCBsvU7UpJZuT9UTeZyNWORT0ppR5rJLIuU7cnvjfRRbyoZjkQ1fKRJoAkhWGfOQrdnPU4P+guSJpq2/mKX4jgZXaVO1mwzV1vAXr46OglgmloK2DDFx+Nq7lU/VnXRnviBcNpMzcdMKQMiZVs4v5xGuAS3om8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GeKS/JEN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27C71F00A3A;
	Thu,  2 Jul 2026 22:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783032650;
	bh=EEdY8SVs6v6LMdMDKNGD6VmHKwWMnS8yTaxEoJNFuMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GeKS/JENCh8MZh75Q5a7GXN2BCMJ/SmlbHX6CfPhBrdKpRwv5wGCmlchjr1tN4hYS
	 PExPjUZsytpFilpyYaO5+eqXo7cKOZvbqmsskS1j/4/6KmTpBuKt/YiDrQzFjome5W
	 vLjc7Fn3G0QjjXPximu54lGNNuDDK5YkE0N50UVNi4kuUo69St6VqDzFuh6gMv59TR
	 ErsDNvJ0rwiFnjl24lrTgRF28928oxz7Xy6FEsxQ8VJZ6L7t9RAj7qh8SK1Fe8YjQJ
	 8CWfx3E09yVH/3f2QaKV5Wmc1Jox1FS+ebYRyGoBkI8iWV2DA8alMqmq+rzo/QPKkE
	 0srrMuR5Ec6OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] leds: st1202: fix spurious pattern sequence
 start in setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manuel Fombuena" <fombuena@outlook.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <GV1PR08MB849724B0FF00255F4760FAE0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
 <GV1PR08MB849724B0FF00255F4760FAE0C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 22:50:50 +0000
Message-Id: <20260702225050.A27C71F00A3A@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-8896-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fombuena@outlook.com,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto,outlook.com:email,vger.kernel.org:from_smtp,smtp.kernel.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15A346FD4F6

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver assigns a sleeping I2C function to the non-blocking `br=
ightness_set` callback, and the blocking callback ignores brightness scalin=
g.
- [Medium] `st1202_led_pattern_set` fails to truncate patterns, leaving tra=
iling sequence steps active.
- [Medium] Per-LED pattern configuration in `st1202_led_pattern_clear` dest=
ructively overwrites shared global sequencer registers, breaking patterns r=
unning on other channels.
- [Medium] The driver leaves the hardware powered on upon probe failure or =
device unbind.
--

commit 892a1c21c022e44fcdad1ed04d340f90f20762de
Author: Manuel Fombuena <fombuena@outlook.com>

leds: st1202: fix spurious pattern sequence start in setup

This commit removes a configuration register write in st1202_setup() that
started the hardware pattern sequencer before any patterns were programmed.
By allowing the device reset to keep the pattern bits cleared, it prevents
the device from running a sequence with uninitialized values.

> diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
> index 3203b3768ec52..b8a5712829009 100644
> --- a/drivers/leds/leds-st1202.c
> +++ b/drivers/leds/leds-st1202.c
> @@ -333,11 +333,6 @@ static int st1202_setup(struct st1202_chip *chip)
>  	if (ret < 0)
>  		return ret;
> =20
> -	ret =3D st1202_write_reg(chip, ST1202_CONFIG_REG,
> -				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
> -	if (ret < 0)
> -		return ret;
> -
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but I noticed the driver assigns a sleeping
I2C function to the non-blocking brightness_set callback:

drivers/leds/leds-st1202.c:st1202_dt_init() {
    ...
        led->led_cdev.brightness_set_blocking =3D st1202_led_set;
        ...
        led->led_cdev.brightness_set =3D st1202_brightness_set;
    ...
}

Will this cause a kernel panic (scheduling while atomic) if a hardware
trigger updates the LED brightness from softirq/hardirq context?

The subsystem calls brightness_set without deferring to a workqueue,
expecting it to be non-blocking, but st1202_brightness_set acquires a mutex
and performs sleeping I2C writes:

drivers/leds/leds-st1202.c:st1202_brightness_set() {
    ...
    guard(mutex)(&chip->lock);
    ...
    st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
    ...
}

Additionally, does the blocking callback ignore actual brightness scaling?
It appears to only turn the channel on or off:

drivers/leds/leds-st1202.c:st1202_led_set() {
    ...
    return st1202_channel_set(led->chip, led->led_num, !!value);
}

[Severity: Medium]
This is a pre-existing issue, but does st1202_led_pattern_set() fail to
truncate patterns, leaving trailing sequence steps active?

drivers/leds/leds-st1202.c:st1202_led_pattern_set() {
    ...
    for (int patt =3D 0; patt < len; patt++) {
        ret =3D st1202_pwm_pattern_write(chip, led->led_num, patt,
                                       pattern[patt].brightness);
        if (ret !=3D 0)
            return ret;

        ret =3D st1202_duration_pattern_write(chip, patt,
                                            pattern[patt].delta_t);
        if (ret !=3D 0)
            return ret;
    }
    ...
}

If a shorter pattern is programmed over a longer one, the loop stops at
len, leaving the global pattern duration registers for trailing steps
unmodified.

Since the hardware sequencer runs up to 8 steps and uses a duration of 0 as
a skip marker, will the LED emit stale flashes from the previously
programmed pattern?

[Severity: Medium]
This is a pre-existing issue, but does st1202_led_pattern_clear()
destructively overwrite shared global sequencer registers?

drivers/leds/leds-st1202.c:st1202_led_pattern_clear() {
    ...
    for (int patt =3D 0; patt < ST1202_MAX_PATTERNS; patt++) {
        ...
        ret =3D st1202_write_reg(chip, ST1202_PATTERN_DUR + patt, 0);
        if (ret !=3D 0)
            return ret;
    }
    ...
}

Calling this function on one LED unconditionally clears the pattern duration
array. Since this array is shared globally across all channels on the chip,
will this break patterns running concurrently on other LEDs?

[Severity: Medium]
This is a pre-existing issue, but does the driver leave the hardware
powered on upon probe failure or device unbind?

drivers/leds/leds-st1202.c:st1202_probe() {
    ...
    ret =3D st1202_setup(chip);
    if (ret < 0)
        return ret;

    ret =3D st1202_dt_init(chip);
    if (ret < 0)
        return ret;
    ...
        ret =3D devm_led_classdev_register_ext(&client->dev, &led->led_cdev,
                                             &init_data);
        if (ret < 0)
            return dev_err_probe(&client->dev, ret,
                    "Failed to register LED class device\n");
    ...
}

The hardware is activated by writing the enable flag during st1202_setup().
If st1202_dt_init() or devm_led_classdev_register_ext() fails, or if the
driver is unbound, there is no devm_add_action_or_reset() or remove hook to
gracefully turn off the chip.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/GV1PR08MB8497C0B898=
789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com?part=3D5

