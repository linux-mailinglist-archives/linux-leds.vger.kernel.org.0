Return-Path: <linux-leds+bounces-5639-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29021BB59D0
	for <lists+linux-leds@lfdr.de>; Fri, 03 Oct 2025 01:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44323B7151
	for <lists+linux-leds@lfdr.de>; Thu,  2 Oct 2025 23:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B723A29AAFD;
	Thu,  2 Oct 2025 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5AetzD5"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E36E254B1B;
	Thu,  2 Oct 2025 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759448194; cv=none; b=bP8puZt3N4pvYLI0ZOSY0PPsxMVFHz5yWXiqlTO2vXdJvaijRRpJjFSC5eLedUX2eRP89cvvfxPLygjrJEbEpft7aHZ0XGSUczu5euVV4mrY5Hvh28wJhxTkvXbewv8b/gEhoqfRifoC9GuUC6QY4AZ1MySi2yYjCuYibYb9YZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759448194; c=relaxed/simple;
	bh=CEbRtWPBQw7JVTWw+FlDva3KxertbeH1B9CTjxieDeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARenRL4gJbiHkCaugwtN4DmYYA8LbO9ntyU99n3J6ysIzAiHLYxCZ1BK0eCJ0t2CS4IHtkRKXg3dUdC93FOu3+LQp+cdyzvnB4w+tf/NK1m0+9tkoYwecdJ1lEa1VJDrrdhvb2AGfk+4XbUb6h3GC7RvbYToeLr2shWdia00kA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5AetzD5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B5BC4CEF4;
	Thu,  2 Oct 2025 23:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759448193;
	bh=CEbRtWPBQw7JVTWw+FlDva3KxertbeH1B9CTjxieDeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i5AetzD5ovQTdk0lHoCmueZNdQDYuMa+bcXRbOhEVGJyFC72roSaMmMu840bJZGvq
	 CfpWjfCU4ULVanQueinCMgQNkufB3uNZCE6+xPK4zoqVMHOm6/3v15PnkNmKYZiKit
	 sQuX9bdUdHXmYsD1h8Q61yMLUD7Az4MXvikQ9tLrYeULFTABLdU2Rpw2yuFanr/AoF
	 1t8yGrblI75tkUQy1tvt4XroslhXSWZNaH2GaDzmAln0HnOXngzSSgA9fPYwC2smR3
	 G7OLWwNwblV0JUqfFLfVJJYUg15nUrjR2oTnSHJMIf7wIvCPdpAuhiGx60cMiWwVir
	 Z+Rn0Ba4mXwYg==
Date: Thu, 2 Oct 2025 16:36:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: kernel test robot <lkp@intel.com>, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net,
	cs@tuxedo.de, wse@tuxedocomputers.com, ggo@tuxedocomputers.com,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, rdunlap@infradead.org,
	alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org,
	lee@kernel.org, pobrn@protonmail.com
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
Message-ID: <20251002233627.GA3978676@ax162>
References: <20250928013253.10869-2-W_Armin@gmx.de>
 <202509290415.uez00SgW-lkp@intel.com>
 <6146d57b-f855-40b1-a644-3af6b28ceea4@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6146d57b-f855-40b1-a644-3af6b28ceea4@gmx.de>

Hi Armin,

On Thu, Oct 02, 2025 at 08:41:19PM +0200, Armin Wolf wrote:
> i think this is a problem inside the clang compiler. I did not encounter this warning when
> build for x86-64 using gcc.

Clang is actually saving you from yourself, it is a bug in GCC that it
does not warn for this:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91951

> > vim +1243 drivers/platform/x86/uniwill/uniwill-acpi.c
> > 
> >    1235	
> >    1236	static int uniwill_notifier_call(struct notifier_block *nb, unsigned long action, void *dummy)
> >    1237	{
> >    1238		struct uniwill_data *data = container_of(nb, struct uniwill_data, nb);
> >    1239		struct uniwill_battery_entry *entry;
> >    1240	
> >    1241		switch (action) {
> >    1242		case UNIWILL_OSD_BATTERY_ALERT:
> > > 1243			guard(mutex)(&data->battery_lock);

mutex_unlock() will be called on &data->battery_lock even when the
default case is taken, as demonstrated by the following test case.

> >    1244			list_for_each_entry(entry, &data->batteries, head) {
> >    1245				power_supply_changed(entry->battery);
> >    1246			}
> >    1247	
> >    1248			return NOTIFY_OK;
> >    1249		default:
> >    1250			guard(mutex)(&data->input_lock);
> >    1251			sparse_keymap_report_event(data->input_device, action, 1, true);
> >    1252	
> >    1253			return NOTIFY_OK;
> >    1254		}
> >    1255	}
> >    1256	
> > 
> 

$ cat test.c
#include <stdio.h>

void cleanup_1(int *a) { printf("+ %s(%p)\n", __func__, a); }
void cleanup_2(int *a) { printf("+ %s(%p)\n", __func__, a); }
void cleanup_3(int *a) { printf("+ %s(%p)\n", __func__, a); }

void no_scopes(int a)
{
    printf("%s(%d)\n", __func__, a);
    switch (a) {
    case 1:
        int case_1 __attribute__((cleanup(cleanup_1)));
        return;
    case 2:
        int case_2 __attribute__((cleanup(cleanup_2)));
        return;
    default:
        int case_default __attribute__((cleanup(cleanup_3)));
        return;
    }
}

void with_scopes(int a)
{
    printf("%s(%d)\n", __func__, a);
    switch (a) {
    case 1: {
        int case_1 __attribute__((cleanup(cleanup_1)));
        return;
    }
    case 2: {
        int case_2 __attribute__((cleanup(cleanup_2)));
        return;
    }
    default: {
        int case_default __attribute__((cleanup(cleanup_3)));
        return;
    }
    }
}

int main(void)
{
    no_scopes(1); printf("\n");
    no_scopes(2); printf("\n");
    no_scopes(3); printf("\n");

    with_scopes(1); printf("\n");
    with_scopes(2); printf("\n");
    with_scopes(3);
}

$ gcc -O2 test.c

$ ./a.out
no_scopes(1)
+ cleanup_1(0x7ffea3450c0c)

no_scopes(2)
+ cleanup_2(0x7ffea3450c10)
+ cleanup_1(0x7ffea3450c0c)

no_scopes(3)
+ cleanup_3(0x7ffea3450c14)
+ cleanup_2(0x7ffea3450c10)
+ cleanup_1(0x7ffea3450c0c)

with_scopes(1)
+ cleanup_1(0x7ffea3450c14)

with_scopes(2)
+ cleanup_2(0x7ffea3450c14)

with_scopes(3)
+ cleanup_3(0x7ffea3450c14)

$ clang -O2 test.c
test.c:12:9: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
   12 |         int case_1 __attribute__((cleanup(cleanup_1)));
      |         ^
test.c:15:9: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
   15 |         int case_2 __attribute__((cleanup(cleanup_2)));
      |         ^
test.c:18:9: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
   18 |         int case_default __attribute__((cleanup(cleanup_3)));
      |         ^
test.c:17:5: error: cannot jump from switch statement to this case label
   17 |     default:
      |     ^
test.c:15:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
   15 |         int case_2 __attribute__((cleanup(cleanup_2)));
      |             ^
test.c:12:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
   12 |         int case_1 __attribute__((cleanup(cleanup_1)));
      |             ^
test.c:14:5: error: cannot jump from switch statement to this case label
   14 |     case 2:
      |     ^
test.c:12:13: note: jump bypasses initialization of variable with __attribute__((cleanup))
   12 |         int case_1 __attribute__((cleanup(cleanup_1)));
      |             ^
3 warnings and 2 errors generated.

https://godbolt.org/z/1Tx7Gj1xf

I would add the scoping to the case labels or use scoped_guard() to
avoid this, which would also avoid the instances of -Wc23-extensions.

Cheers,
Nathan

