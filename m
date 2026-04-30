Return-Path: <linux-leds+bounces-7918-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM1SLP0f82lsxQEAu9opvQ
	(envelope-from <linux-leds+bounces-7918-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 11:25:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDE849FD26
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 11:25:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03AF43010258
	for <lists+linux-leds@lfdr.de>; Thu, 30 Apr 2026 09:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76BA739FCD8;
	Thu, 30 Apr 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM8IhKCc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349D39F160;
	Thu, 30 Apr 2026 09:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777541114; cv=none; b=Oy9rOT7uq29qmOu+lsNwCmZQP6iisSLoB7GQobdRMl9iwPlQmm6/fY3Qw3oNsU9ld2hM9nKcXCm9cKZEm0sWGryos9vY96hP/4MiULfcDg+Qz6jyGi45OsxIyDDDdVUZg8yPJe47guJ+g3NuP7svsUChZHgdKNt8mBQMvULx9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777541114; c=relaxed/simple;
	bh=zsvjEg5G040K3j1nWisvbk6/AZCHJNwK5aizXgBsEeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLXQx8fNaVws/NfPKIYhm81MNncF6TLdxQDWR8z2s7uUjj07QuBVgRx4FX+XAlR46kshfiIeAFmbrW5qfXNOd+Iwz3+06j8FoeVDChGS1XLctpbGGVPeFEYf0kMQmSOqtZAjI0hAaFiYYUvJ8KluMiSgbSXmhbBggyI60UkeRv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM8IhKCc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B398FC2BCB3;
	Thu, 30 Apr 2026 09:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777541114;
	bh=zsvjEg5G040K3j1nWisvbk6/AZCHJNwK5aizXgBsEeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZM8IhKCczQuHkYXyCrzYAwaaemdQcN4w7CBnop5ZZuDchp0kbXUFB5oU10daK751k
	 PgI+Vi1xOdMGO7UNq1CAGdjIVZi9g8FB0hJqJSezLtfnDOYD2l4G8IYGsOFxhblv7A
	 dObApNe8ivL1j4wF0kryP+bj2dRs4h80K0GWKqauY6D2VND2yVbXddbZ8zTxt2B/GJ
	 o+a7tsRGB0nVh9n4gdtSOcU6utgoJlCSoyS9ugOotvrH0heH64w5nhVCeQMMd8sZ4L
	 LJLVJ4lPvqb7uAXMMbESQLZMJ7MzBrpZV0Gjns3Q97Y0pkEZ/AYU8G8B6mo+UakzJi
	 /cP/MKRBnpffw==
Date: Thu, 30 Apr 2026 10:25:08 +0100
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rishit Bansal <rishitbansal0@gmail.com>,
	Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>,
	Edip Hazuri <edip@medip.dev>,
	Mustafa =?utf-8?B?RWvFn2k=?= <mustafa.eskieksi@gmail.com>,
	Xavier Bestel <xav@bes.tel>, linux-leds@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] Documentation: leds: leds-class: Document keyboard
 backlight LED class naming
Message-ID: <20260430092508.GF1806155@google.com>
References: <20260406174638.320135-1-johannes.goede@oss.qualcomm.com>
 <20260406174638.320135-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406174638.320135-2-johannes.goede@oss.qualcomm.com>
X-Rspamd-Queue-Id: 0FDE849FD26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7918-lists,linux-leds=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,gmail.com,medip.dev,bes.tel,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Mon, 06 Apr 2026, Hans de Goede wrote:

> From: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
> 
> Document the existing practice of always using 'kbd_backlight' for
> the function part of LED class device names for LED class devices which
> control single-zone keyboard backlights.
> 
> Also extend this existing practice with a new naming scheme for keyboards
> with zoned backlight control. There are several drivers in the works (see
> the Link:tags below) which offer backlight control for keyboards where
> the keyboard backlight is divided in a limited number of zones, e.g.
> "main", "cursor" and "numpad" zones.
> 
> It is important to agree on a consistent naming scheme for these now,
> so that userspace can support multiple different models / vendors through
> a single unified naming scheme.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20230131235027.36304-1-rishitbansal0@gmail.com/
> Link: https://lore.kernel.org/platform-driver-x86/20240719100011.16656-1-carlosmiguelferreira.2003@gmail.com/
> Link: https://lore.kernel.org/platform-driver-x86/20260304105831.119349-3-edip@medip.dev/
> Link: https://lore.kernel.org/platform-driver-x86/20240806205001.191551-2-mustafa.eskieksi@gmail.com/
> Link: https://lore.kernel.org/linux-input/20260402075239.3829699-1-xav@bes.tel/
> Signed-off-by: Carlos Ferreira <carlosmiguelferreira.2003@gmail.com>
> Co-authored-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

The premise is fine I think.

> ---
>  Documentation/leds/leds-class.rst | 63 +++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
> index 5db620ed27aa..d2b042519a66 100644
> --- a/Documentation/leds/leds-class.rst
> +++ b/Documentation/leds/leds-class.rst
> @@ -116,6 +116,69 @@ above leaves scope for further attributes should they be needed. If sections
>  of the name don't apply, just leave that section blank.
>  
>  
> +Keyboard backlight control LED Device Naming
> +============================================
> +
> +For backlit keyboards with a single brightness / color settings a single
> +(multicolor) LED class device should be used to allow userspace to change
> +the backlight brightness (and if possible the color). This LED class device
> +must use "kbd_backlight" for the function part of the LED class device name.
> +IOW the name must end with ":kbd_backlight".
> +
> +For backlit keyboards with multiple control zones, one (multicolor) LED class
> +device should be used per zone. These LED class devices' name must follow:
> +
> +	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
> +
> +and <devicename> must be the same for all zones of the same keyboard.
> +
> +<zone_name> should be descriptive of which part of the keyboard backlight
> +the zone covers and should be suitable for userspace to show to an end user
> +in an UI for controlling the zones.
> +
> +Where possible <zone_name> should be a value already used by other
> +zoned keyboards with a similar or identical zone layout, e.g.:
> +
> +<devicename>:<color>:kbd_zoned_backlight-right
> +<devicename>:<color>:kbd_zoned_backlight-middle
> +<devicename>:<color>:kbd_zoned_backlight-left
> +<devicename>:<color>:kbd_zoned_backlight-corners
> +<devicename>:<color>:kbd_zoned_backlight-wasd
> +
> +or:
> +
> +<devicename>:<color>:kbd_zoned_backlight-main
> +<devicename>:<color>:kbd_zoned_backlight-cursor
> +<devicename>:<color>:kbd_zoned_backlight-numpad
> +<devicename>:<color>:kbd_zoned_backlight-corners
> +<devicename>:<color>:kbd_zoned_backlight-wasd
> +
> +Note that this is intended for keyboards with a limited number of zones,
> +keyboards with per key addressable backlighting must not use LED class devices
> +since the sysfs API is not suitable for rapidly change multiple LEDs in one
> +"commit" as is necessary to do animations / special effects on such keyboards.
> +
> +An exception to the rule that all zones must follow:
> +
> +	"<devicename>:<color>:kbd_zoned_backlight-<zone_name>"
> +
> +is made for the special case where there is a single big zone which controls
> +the backlighting of almost all of the keyboard and there are some small areas
> +with separate control, like just the 4 cursor keys, or the WASD keys. In this
> +case the main zone should use 'kbd_backlight' for the function part of the name
> +for compatiblity with (older) userspace code which is not aware of

Nit: compatibility

There may be others.  Please run it through a spell checker.

> +the "kbd_zoned_backlight-<zone_name>" function naming scheme.
> +
> +While the smaller zones should use the new zoned naming scheme. Such a setup
> +would result in e.g.:
> +
> +<devicename>:<color>:kbd_backlight
> +<devicename>:<color>:kbd_zoned_backlight-wasd
> +
> +"kbd_zoned_backlight-<zone_name>" aware userspace should be aware of this
> +exception and check for a main zone with a "kbd_backlight" function-name.
> +
> +
>  Brightness setting API
>  ======================
>  
> -- 
> 2.53.0
> 

-- 
Lee Jones

