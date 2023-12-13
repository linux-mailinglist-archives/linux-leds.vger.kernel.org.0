Return-Path: <linux-leds+bounces-373-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 484A9811F88
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 20:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E013B281EDF
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 19:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9C66829E;
	Wed, 13 Dec 2023 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EYBXgPCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xF9Avnod";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EYBXgPCW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xF9Avnod"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCC8D4C;
	Wed, 13 Dec 2023 11:55:42 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8EEB521E1B;
	Wed, 13 Dec 2023 19:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702497340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2qsN/iaV0CRX41UUJSJKQP49f05Rmy6AEHOYxqrZGc=;
	b=EYBXgPCWZ6kgC/R7FPhFermGCT/ximCUoEFI1bE6It6L8PnCl1jZK3oN6qtuo/MqRbufPe
	2PaDPzPoWXpnIAlSBYTgK5Vcjzuanl1fB7tfrEafwUSgJql8DsgnlGZE/o0Jlr7t1mLSVJ
	Ij3Tq9JCqhzPs2oc2xgNt2nD2+BVuog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702497340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2qsN/iaV0CRX41UUJSJKQP49f05Rmy6AEHOYxqrZGc=;
	b=xF9AvnodfKvDMza4v3ik8xo3JYR1nGfWrozkG5r2n+iZDomzBBd1c6UuJr6UJ+pdy27urr
	2tpHyA5B412NOzBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1702497340; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2qsN/iaV0CRX41UUJSJKQP49f05Rmy6AEHOYxqrZGc=;
	b=EYBXgPCWZ6kgC/R7FPhFermGCT/ximCUoEFI1bE6It6L8PnCl1jZK3oN6qtuo/MqRbufPe
	2PaDPzPoWXpnIAlSBYTgK5Vcjzuanl1fB7tfrEafwUSgJql8DsgnlGZE/o0Jlr7t1mLSVJ
	Ij3Tq9JCqhzPs2oc2xgNt2nD2+BVuog=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702497340;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2qsN/iaV0CRX41UUJSJKQP49f05Rmy6AEHOYxqrZGc=;
	b=xF9AvnodfKvDMza4v3ik8xo3JYR1nGfWrozkG5r2n+iZDomzBBd1c6UuJr6UJ+pdy27urr
	2tpHyA5B412NOzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD8641377F;
	Wed, 13 Dec 2023 19:55:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GtZIKzsMemWiBAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 13 Dec 2023 19:55:39 +0000
Date: Wed, 13 Dec 2023 20:55:34 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: rgb: Drop obsolete dependency on COMPILE_TEST
Message-ID: <20231213205534.0101fd56@endymion.delvare>
In-Reply-To: <20231213153838.GM111411@google.com>
References: <20231202214353.7c02f23c@endymion.delvare>
	<20231213153838.GM111411@google.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spam-Score: -3.30
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.989];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Hi Lee,

On Wed, 13 Dec 2023 15:38:38 +0000, Lee Jones wrote:
> On Sat, 02 Dec 2023, Jean Delvare wrote:
> 
> > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > is possible to test-build any driver which depends on OF on any
> > architecture by explicitly selecting OF. Therefore depending on
> > COMPILE_TEST as an alternative is no longer needed.
> > 
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: Lee Jones <lee@kernel.org>
> > ---
> >  drivers/leds/rgb/Kconfig |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> It's not clear to me what this patch improves.

The patch description supposedly explains that, I'm not sure how to
word it better, especially considering that 24 similar patches have
already been accepted by various subsystem maintainers over the past 18
months with the same explanation.

The purpose of COMPILE_TEST is to increase the build test coverage by
letting developers enable drivers which would otherwise not be available
on their architecture or platform. Given that OF can now be enabled on
all architectures and platforms, using COMPILE_TEST as an alternative
is simply no longer needed, and there is no reason to keep dead code.

Cleaning this up has many benefits:
* Makes Kconfig easier to read.
* Makes it clear to the reader that OF is no longer architecture or
  platform dependent.
* Less work for the dependency solver, so faster make *config.
* Avoids copy-and-paste of an obsolete construct to new Kconfig entries.

Lastly, I can quote an explanation which was part of my earlier
submissions but was dropped after someone suggested that it was too
verbose for such a simple clean up. Maybe you will find it meaningful:

    It is actually better to always build such drivers with OF enabled,
    so that the test builds are closer to how each driver will actually be
    built on its intended target. Building them without OF may not test
    much as the compiler will optimize out potentially large parts of the
    code. In the worst case, this could even pop false positive warnings.
    Dropping COMPILE_TEST here improves the quality of our testing and
    avoids wasting time on non-existent issues.

Hope that helps,
-- 
Jean Delvare
SUSE L3 Support

